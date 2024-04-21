import 'dart:async';
import 'package:boxicons/boxicons.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/Map/mapkey.dart';
import 'package:gpa/presentation/Map/markers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:location/location.dart';

//import 'package:gpa/presentation/Map/FAB.dart';

class screen_Map extends ConsumerStatefulWidget {
  const screen_Map({Key? key}) : super(key: key);

  @override
  _screen_Map createState() => _screen_Map();
}

class _screen_Map extends ConsumerState<screen_Map> {
  Set<Marker> Qbuildings = marks.Qbuildings;

  Completer<GoogleMapController> _controller = Completer();
  final locationController = Location();
  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  Set<Marker> selectedMarkers = {};

  Set<Polygon> _createPolygons() {
    final polygons = <Polygon>{};
    List<LatLng> _createPolygonPoints() {
      return const [
        LatLng(26.345759, 43.773258),
        LatLng(26.342467916425075, 43.76944350394701),
        LatLng(26.340934845736683, 43.76783853235856),
        LatLng(26.341973354975124, 43.76663082948568),
        LatLng(26.3441879761044, 43.764061842980425),
        LatLng(26.345115273050354, 43.76303470851816),
        LatLng(26.345009474447693, 43.76274302924851),
        LatLng(26.344094938352097, 43.76159813764617),
        LatLng(26.341897138146514, 43.75922094638717),
        LatLng(26.340201542514254, 43.75717317266534),
        LatLng(26.34073883270159, 43.755576999253435),
        LatLng(26.34078644700235, 43.754964189748556),
        LatLng(26.341598610803743, 43.753833297154614),
        LatLng(26.344146130309635, 43.74820207184782),
        LatLng(26.344784736775825, 43.74405030189676),
        LatLng(26.345208158670367, 43.7426250674185),
        LatLng(26.34670053494838, 43.74250887982744),
        LatLng(26.349785954759646, 43.74241948839774),
        LatLng(26.349785954759646, 43.74241948839774),
        LatLng(26.350313317470835, 43.742428683857206),
        LatLng(26.35232386570832, 43.74230454515595),
        LatLng(26.35493826079973, 43.742224269333974),
        LatLng(26.36830789357227, 43.74166217781414),
        LatLng(26.369237751511967, 43.742158536655715),
        LatLng(26.36887389493614, 43.745858666273),
        LatLng(26.367883390686984, 43.752130837207865),
        LatLng(26.367418457204288, 43.757703593292796),
        LatLng(26.367236526177834, 43.75964390517453),
        LatLng(26.367175882440915, 43.7686009261489),
        LatLng(26.365157572869425, 43.77258043554448),
        LatLng(26.363750595991505, 43.77392316329437),
        LatLng(26.361874600120334, 43.77499279389486),
        LatLng(26.361880809957984, 43.77491397866336),
        LatLng(26.36068326597235, 43.77526104561693),
        LatLng(26.359100968198952, 43.775462421595755),
        LatLng(26.357990570791383, 43.77575674034178),
        LatLng(26.356255553614385, 43.77628341597868),
        LatLng(26.35518677002884, 43.77681009162867),
        LatLng(26.35268827647308, 43.777832461982655),
        LatLng(26.35126973540698, 43.77843385403138),
        LatLng(26.35142222024536, 43.77837004138082),
        LatLng(26.350996751737338, 43.778153811880806),
        LatLng(26.348916447665285, 43.77622388234052),
        LatLng(26.34815166858873, 43.77488504319114),
        LatLng(26.34725088922295, 43.774403383617475),
        LatLng(26.345759, 43.773258),
      ];
    }

    polygons.add(
      Polygon(
        fillColor: Colors.black.withOpacity(0.6),
        polygonId: const PolygonId('test2'),
        points: const [
          LatLng(85, 90),
          LatLng(85, 0.1),
          LatLng(85, -90),
          LatLng(85, -179.9),
          LatLng(0, -179.9),
          LatLng(-85, -179.9),
          LatLng(-85, -90),
          LatLng(-85, 0.1),
          LatLng(-85, 90),
          LatLng(-85, 179.9),
          LatLng(0, 179.9),
          LatLng(85, 179.9)
        ],
        visible: true,
        geodesic: false,
        strokeWidth: 0,
      ),
    );
    if (_createPolygonPoints().isNotEmpty) {
      polygons.add(
        Polygon(
          fillColor: Color.fromARGB(0, 255, 255, 255).withOpacity(0.3),
          strokeColor: Color.fromARGB(253, 17, 54, 90),
          polygonId: const PolygonId('test3'),
          points: _createPolygonPoints(),
          visible: true,
          geodesic: false,
          strokeWidth: 4,
        ),
      );
    }
    return polygons;
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await initializeMap());
    loadData();
    addCustomIcon();
    fetchMarkersFromFirestore();

    fetchLocationUpdates();
    /* Timer.periodic(Duration(seconds: 10), (_) {
      if (currentPosition != null) {
        updatePath(currentPosition!);
      }
    });*/
  }

  // Update the camera position whenever the user's location changes
  void updateCameraPosition(LatLng position) async {
    if (position != null) {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: position, zoom: 15)));
    }
  }

  // Update the user's path
  void updatePath(LatLng position) async {
    if (position != null && currentPosition != null) {
      final List<LatLng> polylineCoordinates = await fetchPolylinePoints(
        currentPosition!,
        position,
      );
      generatePolyLineFromPoints(polylineCoordinates);
      updateCameraPosition(position); // Update camera position
    }
  }

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/bus.png")
        .then(
      (icon) {
        if (mounted) {
          setState(() {
          markerIcon = icon;
        });
        }
        
      },
    );
  }

  static const B = LatLng(26.34900306634682, 43.76681242106987);

  Future<void> initializeMap() async {
    await fetchLocationUpdates();
    if (currentPosition != null) {
      final coordinates = await fetchPolylinePoints(
        currentPosition!,
        B, // Provide the destination location here
      );
      fetchMarkersFromFirestore();
      // addPolygon();
      generatePolyLineFromPoints(coordinates);
    }
  }

  void fetchMarkersFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('selected_places').get();

      querySnapshot.docs.forEach((doc) {
        final data = doc.data() as Map<String, dynamic>?; // Explicit cast
        if (data != null) {
          final latitude = data['latitude'];
          final longitude = data['longitude'];
          final placeName = data['placeName']; // Get the place name
          final markerId = MarkerId(doc.id);

          final String uniqueMarkerId = '$placeName';

          if (latitude != null && longitude != null) {
            final Marker marker = Marker(
              markerId: MarkerId(uniqueMarkerId),
              position: LatLng(latitude, longitude),
              icon: markerIcon,
              infoWindow: InfoWindow(title: placeName),
              onTap: () =>
                  _onMarkerLongPressed(MarkerId(uniqueMarkerId), markerId),
            );

            setState(() {
              _markers.add(marker);
              Qbuildings.add(marker); // Add marker to Qbuildings set
            });
          }
        }
      });
    } catch (error) {
      print('Failed to fetch markers from Firestore: $error');
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
    setState(() {
      placeSelected = true;
    });
  }

  void closeSearchList() {
    setState(() {
      suggestions.clear();
    });
  }

  TextEditingController searchController = TextEditingController();

  bool getDirections = false;

  bool showSearchMarker = false;
  bool showNavigationMarkers = false;
  bool placeSelected = false; // Add this flag

  int markerIdCounter = 1;
  int polylineIdCounter = 1;

  Uint8List? marketimages;

  List<String> images = [
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
    'assets/images/hat.png',
  ];

  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLen = <LatLng>[
    LatLng(26.350659189721537, 43.767918903374316),
    LatLng(26.34739841528648, 43.76734840839205), //1
    LatLng(26.349387167211944, 43.765018229733535), //2
    LatLng(26.352922094022734, 43.77393488788893),
    LatLng(26.350659189721537, 43.767918903374316),
    LatLng(26.36095082397776, 43.749291034015464),
    LatLng(26.34739841528648, 43.76734840839205),
    LatLng(26.36095082397776, 43.749291034015464),
    LatLng(26.347226658485795, 43.76611019011761),
    LatLng(26.348450278424348, 43.76498582490215),
    LatLng(26.362782853570597, 43.74810475521704),
    LatLng(26.3469723809983, 43.7639916757364),
    LatLng(26.348202999061032, 43.764412387680285),
    LatLng(26.348368754299293, 43.76454394382294),
    LatLng(26.34967671377754, 43.76863253048418),
  ];
  final List<String> markerTitles = [
    "كلية الصيدلة",
    "College of Languages & Humanities", //1
    "كلية الطب البشري - مبنى الطالبات B2", //2
    "كلية الصيدلة",
    "العلوم",
    "كلية الحاسب للبنات",
    "الهندسة",
    "كلية الشريعة",
    "كلية التصاميم",
    "كلية الزراعة والبيطري",
    "كلية الهندسة",
    "كلية العلوم",
    "كلية التمريض",
    "مبنى الصيدلة",
    "كلية العلوم التطبيقية",
    "بوابة كلية الحاسب",
    "العلوم A4",
  ];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  loadData() async {
    for (int i = 0; i < images.length; i++) {
      final Uint8List markIcons = await getImages(images[i], 100);
      // makers added according to index
      _markers.add(Marker(
        // given marker id
        markerId: MarkerId(i.toString()),
        // given marker icon
        icon: BitmapDescriptor.fromBytes(markIcons),
        // given position
        position: _latLen[i],
        infoWindow: InfoWindow(
          // given title for marker
          title: markerTitles[i], // Using markerTitles instead of Names
        ),
      ));
      setState(() {});
    }
  }

  late Set<Marker> buildings = Set.from(Qbuildings);
  late List<String> buildingNames =
      Qbuildings.map((marker) => marker.markerId.value.toString()).toList();
  late List<String> suggestions = [];

  var radiusValue = 3000.0;

  var tappedPoint;

  List allFavoritePlaces = [];

  String tokenKey = '';

  void _setMarker(point) {
    var counter = markerIdCounter++;

    final Marker marker = Marker(
        markerId: MarkerId('1'),
        position: point,
        onTap: () {},
        icon:
            markerIcon // BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
        );

    setState(() {
      _markers.add(marker);
    });
  }

  Future<void> _onMarkerLongPressed(
      MarkerId markerId, MarkerId markerval) async {
    final String markerDocId = markerval.value.toString();

    final action = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("MO".tr),
          content: Text('Choose an action:'), //احس ما لها داعي
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop('delete'),
              child: Text("DM".tr),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop('findRoute'),
              child: Text("FR".tr),
            ),
          ],
        );
      },
    );

    if (action == 'delete') {
      // Remove the marker from the map
      setState(() {
        _markers.removeWhere((marker) => marker.markerId == markerId);
      });

      // Delete the marker from Firestore
      await FirebaseFirestore.instance
          .collection('selected_places')
          .doc(markerDocId)
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('MD'.tr),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else if (action == 'findRoute') {
      final selectedMarker = _markers.firstWhere(
        (marker) => marker.markerId == markerId,
        orElse: () => Marker(
          markerId: MarkerId(""),
          position: LatLng(0, 0), // Default position if not found
        ),
      );

      if (currentPosition != null) {
        print(selectedMarker.position);
        // Draw polyline between current position and selected place
        onDestinationSelected(selectedMarker.position);
      }
    }
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
        if (showNavigationMarkers) {
          updatePath(currentPosition!); // Update path when location changes
        }
        // Update camera position to follow user
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
      color: Color.fromARGB(255, 0, 16, 107),
      points: polylineCoordinates,
      width: 5,
    );
    updateCameraPosition(currentPosition!);

    setState(() {
      polylines[id] = polyline; // Update polylines state
    });
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
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight - 60,
                width: screenWidth,
                child: currentPosition == null
                    ? const Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        onTap: (tapped) async {
                          setState(() {
                            tappedPoint = tapped;
                          });

                          _setMarker(tapped); // Add this line to set the marker
                        },
                        mapType: MapType.satellite,
                        markers: Set<Marker>.of(_markers)
                          ..addAll({
                            Marker(
                              markerId: const MarkerId('currentLocation'),
                              infoWindow: InfoWindow(title: "CL".tr),
                              icon: markerIcon,
                              position: currentPosition!,
                            ),
                          }),
                        polygons: _createPolygons(),
                        polylines: Set<Polyline>.of(polylines.values),
                        initialCameraPosition:
                            CameraPosition(target: _sourceLocation, zoom: 14.5),
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
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(44, 0, 0, 0),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Color.fromARGB(255, 255, 253, 253)),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 11.0),
                          border: InputBorder.none,
                          hintText: 'search'.tr,
                          hintStyle: GoogleFonts.getFont(
                            MyLocal.getFontFamily(Get.locale!.languageCode),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                searchController.text = '';
                                suggestions.clear();
                                polylines
                                    .clear(); // Clear suggestions when search text is cleared
                              });
                            },
                            icon: Icon(BoxIcons.bx_x),
                          ),
                        ),
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
                          //  borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.7),
                        ),
                        child: ListTile(
                          title: Text(suggestion),
                          leading: const Icon(
                            Icons.location_on,
                            color: Color.fromARGB(255, 0, 168, 171),
                          ),
                          onTap: () async {
                            searchController.text = suggestion;
                            final selectedMarker = Qbuildings.firstWhere(
                              (marker) =>
                                  marker.markerId.value.toString() ==
                                  suggestion,
                              orElse: () => const Marker(
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

                            closeSearchList();
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
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.only(bottom: 15, left: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(53, 0, 0, 0),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () async {
                    if (currentPosition != null) {
                      GoogleMapController controller = await _controller.future;
                      controller.animateCamera(CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(
                            currentPosition!.latitude,
                            currentPosition!.longitude,
                          ),
                          zoom: 15,
                        ),
                      ));
                    }
                  },
                  icon: const Icon(
                    BoxIcons.bx_current_location,
                    color: Color.fromARGB(255, 0, 167, 171),
                  ),
                  splashColor: Color.fromARGB(255, 171, 0, 0),
                ),
              ),
              SizedBox(height: 14),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(53, 0, 0, 0),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () async {
                    final TextEditingController placeNameController =
                        TextEditingController();

                    await showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("SP".tr),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('PN'.tr),
                              TextField(
                                controller: placeNameController,
                                decoration: InputDecoration(
                                  hintText: 'HN'.tr,
                                ),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                final String placeName =
                                    placeNameController.text.trim();
                                if (placeName.isNotEmpty) {
                                  await FirebaseFirestore.instance
                                      .collection('selected_places')
                                      .add({
                                    'latitude': tappedPoint.latitude,
                                    'longitude': tappedPoint.longitude,
                                    'placeName': placeName,
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('SA: $placeName'.tr),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('plsN'.tr),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                                Navigator.of(context).pop();
                              },
                              child: Text('Save'.tr),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'.tr),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    BoxIcons.bxs_bookmark,
                    color: Color.fromARGB(255, 0, 167, 171),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
