import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gpa/presentation/resources/constants.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  static const LatLng _sourceLocation =
      LatLng(26.34847508549134, 43.767713423546866);
  static const LatLng _destination = LatLng(26.3309777, 43.7598077);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then(
      (location) {
        setState(() {
          currentLocation = location;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    _getPolyline();
  }

  Future<void> _getPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key, // Google Maps API Key
      PointLatLng(_sourceLocation.latitude, _sourceLocation.longitude),
      PointLatLng(_destination.latitude, _destination.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Upper(),
          Expanded(
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _sourceLocation, zoom: 14.5),
              markers: {
                Marker(
                  markerId: MarkerId("Main Building"),
                  position: _sourceLocation,
                ),
                Marker(
                  markerId: MarkerId("Destination"),
                  position: _destination,
                ),
              },
              polylines: {
                Polyline(
                  polylineId: PolylineId("drivingRoute"),
                  color: Colors.blue,
                  width: 5,
                  points: polylineCoordinates,
                ),
              },
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
