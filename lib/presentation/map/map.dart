import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpa/presentation/Map/FAB.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
//import 'package:gpa/presentation/resources/constants.dart';
//import 'package:location/location.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

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
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition:
                        CameraPosition(target: _sourceLocation, zoom: 14.5),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FAB(),
    );
  }

  Widget buildFBA(IconData icon) => SizedBox();
}
/*
  static const LatLng _sourceLocation =
      LatLng(26.34847508549134, 43.767713423546866);
  static const LatLng _destination = LatLng(26.3309777, 43.7598077);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  static final Polyline _MyLine = Polyline(
    polylineId: PolylineId("_MyLine"),
    points: [
      LatLng(26.34847508549134, 43.767713423546866),
      LatLng(26.3309777, 43.7598077),
    ],
    color: Color.fromARGB(255, 0, 168, 171),
    width: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Upper(),
          Expanded(
            child: /* currentLocation == null
                ? Text("Loading")
                :*/
                GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _sourceLocation, zoom: 14.5),
              markers: {  
                const Marker(
                  markerId: MarkerId("Main Bulding"),
                  //infoWindow: InfoWindow,
                  //icon: BitmapDescriptor.defultMarker,
                  position: _sourceLocation,
                ),
                const Marker(
                  markerId: MarkerId("dest"),
                  position: _destination,
                ),
                /* Marker(
                        markerId: const MarkerId("currentLocation"),
                        position: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                      ),*/
              },
              polylines: {_MyLine},
            ),
          ),
        ],
      ),
    );
  }

  Widget Upper() {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 168, 171),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                // Handle back button press
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25.0,
              ),
              padding: EdgeInsets.all(0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "MAP",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
*/
