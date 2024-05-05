import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IconMap extends StatefulWidget {
  const IconMap({Key? key}) : super(key: key);

  @override
  _IconMapState createState() => _IconMapState();
}

class _IconMapState extends State<IconMap> {
  late BitmapDescriptor markerIcon;

  @override
  void initState() {
    super.initState();
    addCustomIcon();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/bus.png",
    ).then((icon) {
      if (mounted) {
        setState(() {
          markerIcon = icon;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  BitmapDescriptor getMarkerIcon() {
    return markerIcon;
  }
}
