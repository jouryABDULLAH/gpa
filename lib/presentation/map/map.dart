import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:google_places_flutter/google_places_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapScreenState();
}

class _MapScreenState extends State<Map> {
  GoogleMapController? gc;

  static const CameraPosition cameraPosition = CameraPosition(
    target: LatLng(26.34847508549134, 43.767713423546866),
    zoom: 14,
  );

  List<Marker> marks = [];

  StreamSubscription<Position>? positionStream;
  initials() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.whileInUse) {
      positionStream =
          Geolocator.getPositionStream().listen((Position? position) {
        marks.add(Marker(
            markerId: MarkerId("current"),
            position: LatLng(position!.latitude, position.longitude)));
        gc!.animateCamera(CameraUpdate.newLatLng(
            LatLng(position.latitude, position.longitude)));
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    initials();
    super.initState();
  }

  @override
  void dispose() {
    positionStream!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('map'),
      ),
      body: Container(
          height: 500,
          child: Column(
            children: [
              Expanded(
                  child: GoogleMap(
                onTap: (LatLng latLng) async {
                  marks.add(Marker(
                      markerId: MarkerId("1"),
                      position: LatLng(latLng.latitude, latLng.longitude)));
                  List<Location> locations =
                      await locationFromAddress("Gronausestraat 710, Enschede");
                },
                markers: marks.toSet(),
                initialCameraPosition: cameraPosition,
                mapType: MapType.normal,
                onMapCreated: (mapController) {
                  gc = mapController;
                },
                //onLongPress: _addmark,
              )),
              // floatingActionButton: FloatingActionButton(
              //  backgroundColor: Theme.of(context).primaryColor,
              //  foregroundColor: Color.fromARGB(255, 0, 167, 171)

              // )
            ],
          )),
    );
  }
}
