import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;

class SearchMap extends StatefulWidget {
  const SearchMap({Key? key}) : super(key: key);

  @override
  State<SearchMap> createState() => _SearchMap();
}

class _SearchMap extends State<SearchMap> {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.normal);
  TextEditingController searchController = TextEditingController();
  late Set<maps.Marker> buildings = Set.from(allbuilding);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Upper(), // Place Upper widget at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
                onChanged: seearchBuilding,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: buildings.length,
              itemBuilder: (context, index) {
                final build = buildings.elementAt(index);
                return ListTile(
                  leading:
                      Icon(Icons.location_on, color: Colors.green, size: 25.0),
                  title: Text(build.markerId.value.toString()),
                  // onTap:()=>,
                );
              },
            ),
          )
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
              onPressed: () {},
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
              "mapsearch",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void seearchBuilding(String query) {
    final suggestions = allbuilding.where((build) {
      final buildingName = build.markerId.value.toString().toLowerCase();
      final input = query.toLowerCase();
      return buildingName.contains(input);
    }).toSet();

    setState(() => buildings = suggestions);
  }
}

class Buildings {
  late final String title;
  late final String id;
  late maps.LatLng position;

  Buildings({
    required this.title,
    required this.id,
    required this.position,
  });
}

const allbuilding = [
  maps.Marker(
    markerId: maps.MarkerId("Qassim University"),
    position: maps.LatLng(26.34900306634682, 43.76681242106987),
    infoWindow: maps.InfoWindow(title: "Qassim University"),
  ),
  maps.Marker(
    markerId: maps.MarkerId("Qassim University Grand Mosque"),
    position: maps.LatLng(26.34864615733482, 43.764528904833334),
    infoWindow: maps.InfoWindow(title: "Qassim University Grand Mosque"),
  ),
  maps.Marker(
    markerId: maps.MarkerId("Co llege of Languages & Humanities"),
    position: maps.LatLng(26.349387167211944, 43.765018229733535),
    infoWindow: maps.InfoWindow(title: "Coll ege of Languages & Humanities"),
  ),
];
