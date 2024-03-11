/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa/presentation/map/controller.dart';
//import 'package:';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/map/search_dialogue.dart';
import 'package:google_fonts/google_fonts.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late CameraPosition _cameraPosition;
  @override
  void initState() {
    super.initState();
    _cameraPosition = CameraPosition(
        target: LatLng(26.34847508549134, 43.767713423546866), zoom: 17);
  }

  late GoogleMapController _mapController;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'خريطة جامعة القصيم',
          style: GoogleFonts.tajawal(),
        ),
        backgroundColor: Color.fromARGB(255, 0, 167, 171),
      ),
      body: GetBuilder<LocationController>(
        builder: (locationController) {
          return Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: (GoogleMapController mapController) {
                  _mapController = mapController;
                  //locationController.setMapController(mapController);
                },
                initialCameraPosition: _cameraPosition,
              ),
              Positioned(
                top: 100,
                left: 10,
                right: 20,
                child: GestureDetector(
                  onTap: () => Get.dialog(
                    LocationSearchDialog(mapController: _mapController),
                  ),
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 25,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 5),
                        //here we show the address on the top
                        Expanded(
                          child: Text(
                            '${locationController.pickPlaceMark.name ?? ''} ${locationController.pickPlaceMark.locality ?? ''} '
                            '${locationController.pickPlaceMark.postalCode ?? ''} ${locationController.pickPlaceMark.country ?? ''}',
                            style: TextStyle(fontSize: 20),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.search,
                          size: 25,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
*/