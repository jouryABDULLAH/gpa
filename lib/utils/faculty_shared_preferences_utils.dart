// shared_preferences_utils.dart

import 'dart:convert';
import 'package:gpa/model/faculty_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveFacultyToSharedPreferences(List<Faculty> facultyInfo) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = facultyInfo.map((faculty) => faculty.toJson()).toList();
  await prefs.setString('faculty', json.encode(jsonList));
}

Future<List<Faculty>> getFacultyFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = prefs.getString('faculty');
  if (jsonList != null) {
    final Iterable decoded = json.decode(jsonList);
    return decoded.map((faculty) => Faculty.fromJson(faculty)).toList();
  }
  return [];
}
