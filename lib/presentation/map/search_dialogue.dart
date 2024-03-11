/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/model/prediction.dart';
import '../map/controller.dart';
//import 'package:google_maps_webservice/places.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationSearchDialog extends StatelessWidget {
  final GoogleMapController? mapController;
  const LocationSearchDialog({required this.mapController});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return Container(
      margin: EdgeInsets.only(top: 150),
      padding: EdgeInsets.all(5),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: SizedBox(
          width: 350,
          child: TypeAheadField<Prediction>(
            builder: (context, TextEditingController _controller,
                FocusNode _focusNode) {
              return TextFormField(
                controller: _controller,
                textInputAction: TextInputAction.search,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  hintText: 'ابحث عن المبنى',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                ),
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: Theme.of(context).textTheme.bodyText1?.color,
                      fontSize: 20,
                    ),
              );
            },
            suggestionsCallback: (pattern) async {
              return await Get.find<LocationController>()
                  .searchLocation(context, pattern);
            },
            itemBuilder: (context, Prediction suggestion) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Expanded(
                      child: Text(
                        suggestion.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyText1?.color,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ],
                ),
              );
            },
            onSelected: (Prediction suggestion) {
              print("My location is " + suggestion.description!);
              // Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
              Get.back();
            },
          ),
        ),
      ),
    );
  }
}*/
