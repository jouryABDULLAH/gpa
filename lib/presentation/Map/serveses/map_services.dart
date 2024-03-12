import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gpa/presentation/Map/models/auto_complate_results.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MapServices {
  final String key = "AIzaSyASoKOAcsta9Z2-RtDNIM8sd93garJbxGM";
  final String types = 'geocode';

  Future<List<AutoCompleteResult>> searchPlaces(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    var results = json['predictions'] as List;

    return results.map((e) => AutoCompleteResult.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>> getPlace(String? input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$input&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    var results = json['result'] as Map<String, dynamic>;

    return results;
  }

  Future<Map<String, dynamic>> getDirections(
      String origin, String destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?destination=$origin&origin=$destination&key=$key';

    var response = await http.get(Uri.parse(url));

    var results = {
      'bounds_ne': convert.jsonDecode(response.body)['routes'][0]['bounds']
          ['northeast'],
      'bounds_sw': convert.jsonDecode(response.body)['routes'][0]['bounds']
          ['southwest'],
      'start_location': convert.jsonDecode(response.body)['routes'][0]['legs']
          [0]['start_location'],
      'end_location': convert.jsonDecode(response.body)['routes'][0]['legs'][0]
          ['end_location'],
      'polyline': convert.jsonDecode(response.body)['routes'][0]
          ['overview_polyline']['points'],
      'polyline_decoded': PolylinePoints().decodePolyline(
          convert.jsonDecode(response.body)['routes'][0]['overview_polyline']
              ['points'])
    };

    return results;
  }

  Future<dynamic> getPlaceDetails(LatLng coords, int radius) async {
    var lat = coords.latitude;
    var lng = coords.longitude;

    final String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?&location=$lat,$lng&radius=$radius&key=$key';

    var response = await http.get(Uri.parse(url));

    var json = convert.jsonDecode(response.body);

    return json;
  }

  // Method to add a custom place with given latitude and longitude
  Future<Map<String, dynamic>> addCustomPlace(
      double latitude, double longitude) async {
    // Construct the custom place object
    var customPlace = {
      'latitude': latitude,
      'longitude': longitude,
      // You can add more properties if needed
    };

    // Return the custom place object
    return customPlace;
  }
}
