import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/Map/mapkey.dart';
import 'package:gpa/presentation/Map/markers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import 'package:location/location.dart';

//import 'package:gpa/presentation/Map/FAB.dart';

class screen_Map extends ConsumerStatefulWidget {
  const screen_Map({Key? key}) : super(key: key);

  @override
  _screen_Map createState() => _screen_Map();
}

class _screen_Map extends ConsumerState<screen_Map> {
  Completer<GoogleMapController> _controller = Completer();
  final locationController = Location();
  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await initializeMap());
  }

  static const B = LatLng(26.34900306634682, 43.76681242106987);

  Future<void> initializeMap() async {
    await fetchLocationUpdates();
    if (currentPosition != null) {
      final coordinates = await fetchPolylinePoints(
        currentPosition!,
        B, // Provide the destination location here
      );
      generatePolyLineFromPoints(coordinates);
    }
  }

  void onDestinationSelected(LatLng destination) async {
    if (currentPosition != null) {
      final List<LatLng> polylineCoordinates = await fetchPolylinePoints(
        currentPosition!,
        destination,
      );
      generatePolyLineFromPoints(polylineCoordinates);
    }
  }

//Text Editing Controllers
  TextEditingController searchController = TextEditingController();

  bool getDirections = false;

  bool showSearchMarker = false;
  bool showNavigationMarkers = false;

  int markerIdCounter = 1;
  int polylineIdCounter = 1;

  Set<Marker> _markers = Set<Marker>();

  late Set<Marker> buildings = Set.from(Qbuildings);
  late List<String> buildingNames =
      Qbuildings.map((marker) => marker.markerId.value.toString()).toList();
  late List<String> suggestions = [];

//Circle

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

  void _setCircle(LatLng point) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: point, zoom: 12)));
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

  Future<void> fetchLocationUpdates() async {
    bool serviceEnbled;
    PermissionStatus permissionGranted;

    serviceEnbled = await locationController.serviceEnabled();

    if (serviceEnbled) {
      serviceEnbled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
      }
    });
  }

  LatLng ocation = LatLng(26.34847508549134, 43.767713423546866);

  Future<List<LatLng>> fetchPolylinePoints(
      LatLng origin, LatLng destination) async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      debugPrint(result.errorMessage);
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() => polylines[id] = polyline);
  }

  BitmapDescriptor customMarkerIcon(Color color) {
    return BitmapDescriptor.defaultMarkerWithHue(color != Colors.red
        ? BitmapDescriptor.hueGreen
        : BitmapDescriptor.hueRed);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                  child: currentPosition == null
                      ? const Center(child: CircularProgressIndicator())
                      : GoogleMap(
                          mapType: MapType.normal,
                          markers: Set<Marker>.of(_markers)
                            ..addAll(Qbuildings)
                            ..addAll({
                              Marker(
                                markerId: const MarkerId('currentLocation'),
                                icon: customMarkerIcon(Colors.blue),
                                position: currentPosition!,
                              ),
                              Marker(
                                markerId: const MarkerId('sourceLocation'),
                                icon: BitmapDescriptor.defaultMarker,
                                position: const LatLng(
                                    26.36381418346422, 43.742127942805475),
                              ),
                              Marker(
                                markerId: const MarkerId('destinationLocation'),
                                icon: BitmapDescriptor.defaultMarker,
                                position: const LatLng(
                                    26.34900306634682, 43.76681242106987),
                              )
                            }),
                          polylines: Set<Polyline>.of(polylines.values),
                          initialCameraPosition: CameraPosition(
                              target: _sourceLocation, zoom: 14.5),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 5.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15.0),
                              border: OutlineInputBorder(),
                              hintText: "search".tr,
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      searchController.text = '';
                                    });
                                  },
                                  icon: Icon(Icons.close))),
                          onChanged: (query) {
                            setState(() {
                              suggestions = buildingNames
                                  .where((option) => option
                                      .toLowerCase()
                                      .contains(query.toLowerCase()))
                                  .toList();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 80.0,
                  left: 15.0,
                  child: Container(
                    height: 200.0,
                    width: screenWidth - 30.0,
                    child: ListView.builder(
                      itemCount: suggestions.length,
                      itemBuilder: (context, index) {
                        final suggestion = suggestions[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.7),
                          ),
                          child: ListTile(
                            title: Text(suggestion),
                            leading: Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 0, 168, 171),
                            ),
                            onTap: () async {
                              searchController.text = suggestion;
                              final selectedMarker = Qbuildings.firstWhere(
                                (marker) =>
                                    marker.markerId.value.toString() ==
                                    suggestion,
                                orElse: () => Marker(
                                  markerId: MarkerId(""),
                                  position: LatLng(
                                      0, 0), // Default position if not found
                                ),
                              );

                              // Move the camera to the selected marker's position
                              GoogleMapController controller =
                                  await _controller.future;
                              controller.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: selectedMarker.position,
                                    zoom: 15,
                                  ),
                                ),
                              );

                              // Draw polyline between current position and selected place
                              onDestinationSelected(selectedMarker.position);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
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
            /*  IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.navigation),
            ),*/
            SizedBox(height: 16),
            IconButton(
              onPressed: () async {
                GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(26.34900306634682, 43.76681242106987),
                        zoom: 15)));
              },
              icon: Icon(
                Icons.place,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  void seearchBuilding(String query) {
    final suggestions = Qbuildings.where((build) {
      final buildingName = build.markerId.value.toString().toLowerCase();
      final input = query.toLowerCase();
      return buildingName.contains(input);
    }).toSet();

    setState(() => Qbuildings = suggestions);
  }
}
