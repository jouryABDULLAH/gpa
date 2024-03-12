import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gpa/presentation/Map/models/auto_complate_results.dart';
import 'package:gpa/presentation/Map/serveses/map_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpa/presentation/Map/providers/search_plases.dart';
import 'dart:ui' as ui;

//import 'package:gpa/presentation/Map/FAB.dart';

class Map extends ConsumerStatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends ConsumerState<Map> {
  Completer<GoogleMapController> _controller = Completer();

//Text Editing Controllers
  TextEditingController searchController = TextEditingController();
  TextEditingController _originController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();

  Timer? _debounce;

  bool searchToggle = false;
  bool radiusSlider = false;
  bool cardTapped = false;
  bool pressedNear = false;
  bool getDirections = false;

  int markerIdCounter = 1;
  int polylineIdCounter = 1;

  Set<Marker> _markers = Set<Marker>();
  Set<Marker> _markersDupe = Set<Marker>();
  Set<Polyline> _polylines = Set<Polyline>();

  late Set<Marker> buildings = {
    Marker(
      markerId: MarkerId("Qassim University"),
      position: LatLng(26.34900306634682, 43.76681242106987),
      infoWindow: InfoWindow(title: "Qassim University"),
    ),
    Marker(
      markerId: MarkerId("Qassim University Grand Mosque"),
      position: LatLng(26.34864615733482, 43.764528904833334),
      infoWindow: InfoWindow(title: "Qassim University Grand Mosque"),
    ),
    Marker(
      markerId: MarkerId("College of Languages & Humanities"),
      position: LatLng(26.349387167211944, 43.765018229733535),
      infoWindow: InfoWindow(title: "College of Languages & Humanities"),
    ),
  };

//Circle
  Set<Circle> _circles = Set<Circle>();

  var radiusValue = 3000.0;

  var tappedPoint;

  List allFavoritePlaces = [];

  String tokenKey = '';

  void _setMarker(point) {
    var counter = markerIdCounter++;

    final Marker marker = Marker(
        markerId: MarkerId('marker_$counter'),
        position: point,
        onTap: () {},
        icon: BitmapDescriptor.defaultMarker);

    setState(() {
      _markers.add(marker);
    });
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdVal = 'polyline_$polylineIdCounter';

    polylineIdCounter++;

    _polylines.add(Polyline(
        polylineId: PolylineId(polylineIdVal),
        width: 2,
        color: const Color.fromRGBO(33, 150, 243, 1),
        points: points.map((e) => LatLng(e.latitude, e.longitude)).toList()));
  }

  void _setCircle(LatLng point) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: point, zoom: 12)));
    setState(() {
      _circles.add(Circle(
          circleId: CircleId('raj'),
          center: point,
          fillColor: Color.fromARGB(255, 214, 69, 16).withOpacity(0.1),
          radius: radiusValue,
          strokeColor: Color.fromARGB(255, 224, 122, 49),
          strokeWidth: 1));
      getDirections = false;
      searchToggle = false;
      radiusSlider = true;
    });
  }

  _setNearMarker(LatLng point, String label, List types, String status) async {
    var counter = markerIdCounter++;

    final Uint8List markerIcon;

    if (types.contains('restaurants'))
      markerIcon =
          await getBytesFromAsset('assets/mapicons/restaurants.png', 75);
    else if (types.contains('food'))
      markerIcon = await getBytesFromAsset('assets/mapicons/food.png', 75);
    else if (types.contains('school'))
      markerIcon = await getBytesFromAsset('assets/mapicons/schools.png', 75);
    else if (types.contains('bar'))
      markerIcon = await getBytesFromAsset('assets/mapicons/bars.png', 75);
    else if (types.contains('lodging'))
      markerIcon = await getBytesFromAsset('assets/mapicons/hotels.png', 75);
    else if (types.contains('store'))
      markerIcon =
          await getBytesFromAsset('assets/mapicons/retail-stores.png', 75);
    else if (types.contains('locality'))
      markerIcon =
          await getBytesFromAsset('assets/mapicons/local-services.png', 75);
    else
      markerIcon = await getBytesFromAsset('assets/mapicons/places.png', 75);

    final Marker marker = Marker(
        markerId: MarkerId('marker_$counter'),
        position: point,
        onTap: () {},
        icon: BitmapDescriptor.fromBytes(markerIcon));

    setState(() {
      _markers.add(marker);
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);

    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final allSearchResults = ref.watch(placeResultsProvider);
    final searchFlag = ref.watch(searchToggleProvider);

    const LatLng _sourceLocation =
        LatLng(26.34847508549134, 43.767713423546866);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers: Set<Marker>.of(_markers)..addAll(buildings),
                    circles: _circles,
                    polylines: _polylines,
                    initialCameraPosition:
                        CameraPosition(target: _sourceLocation, zoom: 14.5),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onTap: (point) {
                      tappedPoint = point;
                      _setCircle(point);
                    },
                  ),
                ),
                searchToggle
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 5.0),
                        child: Column(
                          children: [
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                controller: searchController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 15.0),
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        searchToggle = false;

                                        searchController.text = '';

                                        searchController.text = '';
                                        _markers = {};
                                        if (searchFlag.searchToggle)
                                          searchFlag.toggleSearch();
                                      });
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (_debounce?.isActive ?? false)
                                    _debounce?.cancel();
                                  _debounce = Timer(Duration(milliseconds: 700),
                                      () async {
                                    if (value.length > 2) {
                                      if (!searchFlag.searchToggle) {
                                        searchFlag.toggleSearch();
                                        _markers = {};
                                      }

                                      List<AutoCompleteResult> searchResults =
                                          await MapServices()
                                              .searchPlaces(value);

                                      allSearchResults
                                          .setResults(searchResults);
                                    } else {
                                      List<AutoCompleteResult> emptyList = [];
                                      allSearchResults.setResults(emptyList);
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                searchFlag.searchToggle
                    ? allSearchResults.allReturnedResults.length != 0
                        ? Positioned(
                            top: 100.0,
                            left: 15.0,
                            child: Container(
                              height: 200.0,
                              width: screenWidth - 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white.withOpacity(0.7),
                              ),
                              child: ListView(
                                children: [
                                  ...allSearchResults.allReturnedResults
                                      .map((e) => buildListItem(e, searchFlag))
                                ],
                              ),
                            ))
                        : Positioned(
                            top: 100.0,
                            left: 15.0,
                            child: Container(
                              height: 200.0,
                              width: screenWidth - 30.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white.withOpacity(0.7),
                              ),
                              child: Center(
                                child: Column(children: [
                                  Text('No results to show',
                                      style: TextStyle(
                                          fontFamily: 'WorkSans',
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(height: 5.0),
                                  Container(
                                    width: 125.0,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        searchFlag.toggleSearch();
                                      },
                                      child: Center(
                                        child: Text(
                                          'Close this',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'WorkSans',
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ))
                    : Container(),
                getDirections
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 5),
                        child: Column(children: [
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: _originController,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 15.0),
                                  border: InputBorder.none,
                                  hintText: 'Origin'),
                            ),
                          ),
                          SizedBox(height: 3.0),
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              controller: _destinationController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 15.0),
                                border: InputBorder.none,
                                hintText: 'Destination',
                                suffixIcon: Container(
                                    width: 96.0,
                                    child: Row(children: [
                                      IconButton(
                                        onPressed: () async {
                                          var directions = await MapServices()
                                              .getDirections(
                                                  _originController.text,
                                                  _destinationController.text);
                                          _markers = {};
                                          _polylines = {};
                                          gotoPlace(
                                              directions['start_location']
                                                  ['lat'],
                                              directions['start_location']
                                                  ['lng'],
                                              directions['end_location']['lat'],
                                              directions['end_location']['lng'],
                                              directions['bounds_ne'],
                                              directions['bounds_sw']);
                                          _setPolyline(
                                              directions['polyline_decoded']);
                                        },
                                        icon: Icon(Icons.search),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              getDirections = false;
                                              _originController.text = '';
                                              _destinationController.text = '';
                                              _markers = {};
                                              _polylines = {};
                                            });
                                          },
                                          icon: Icon(Icons.close))
                                    ])),
                              ),
                            ),
                          )
                        ]),
                      )
                    : Container(),
                radiusSlider
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
                        child: Container(
                            height: 50.0,
                            color: Colors.black.withOpacity(0.2),
                            child: Row(children: [
                              Expanded(
                                  child: Slider(
                                      max: 7000.0,
                                      min: 1000.0,
                                      value: radiusValue,
                                      onChanged: (newVal) {
                                        radiusValue = newVal;
                                        pressedNear = false;
                                        _setCircle(tappedPoint);
                                      })),
                              IconButton(
                                  onPressed: () {
                                    if (_debounce?.isActive ?? false)
                                      _debounce?.cancel();
                                    _debounce =
                                        Timer(Duration(seconds: 2), () async {
                                      var placesResult = await MapServices()
                                          .getPlaceDetails(
                                              tappedPoint, radiusValue.toInt());

                                      List<dynamic> placesWithin =
                                          placesResult['results'] as List;

                                      allFavoritePlaces = placesWithin;

                                      tokenKey =
                                          placesResult['next_page_token'] ??
                                              'none';
                                      _markers = {};
                                      placesWithin.forEach((element) {
                                        _setNearMarker(
                                          LatLng(
                                              element['geometry']['location']
                                                  ['lat'],
                                              element['geometry']['location']
                                                  ['lng']),
                                          element['name'],
                                          element['types'],
                                          element['business_status'] ??
                                              'not available',
                                        );
                                      });
                                      _markersDupe = _markers;
                                      pressedNear = true;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.near_me,
                                    color: Colors.blue,
                                  ))
                            ])))
                    : Container()
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  searchToggle = false;
                  radiusSlider = false;
                  pressedNear = false;
                  cardTapped = false;
                  getDirections = true;
                });
              },
              icon: Icon(Icons.navigation),
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  searchToggle = true;
                  radiusSlider = false;
                  pressedNear = false;
                  cardTapped = false;
                  getDirections = false;
                });
              },
              backgroundColor: Color.fromARGB(255, 34, 137, 255),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),

// Pass searchToggle value to FAB
    );
  }

//**//**هنا مهممممممممممممممممممممم */ */
  gotoPlace(double lat, double lng, double endLat, double endLng, boundsNe,
      boundsSw) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(
            southwest: LatLng(boundsSw['lat'], boundsSw['lng']),
            northeast: LatLng(boundsNe['lat'], boundsNe['lng'])),
        25));

    _setMarker(LatLng(lat, lng));
    _setMarker(LatLng(endLat, endLng));
  }

  Future<void> gotoSearchedPlace(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12)));

    _setMarker(LatLng(lat, lng));
  }

  Widget buildListItem(AutoCompleteResult placeItem, searchFlag) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTapDown: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onTap: () async {
          var place = await MapServices().getPlace(placeItem.placeId);
          gotoSearchedPlace(place['geometry']['location']['lat'],
              place['geometry']['location']['lng']);
          searchFlag.toggleSearch();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.green, size: 25.0),
            SizedBox(width: 4.0),
            Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width - 75.0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(placeItem.description ?? ''),
              ),
            )
          ],
        ),
      ),
    );
  }
}
