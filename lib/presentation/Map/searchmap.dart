import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Set<Marker> Qbuildings = {
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
