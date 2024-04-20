import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Faculty {
  String name;
  String email;
  String department;

  Faculty({required this.name, required this.email, required this.department});

  factory Faculty.fromJson(Map<String, dynamic> json) {
    return Faculty(
      name: json["name"],
      email: json["email"],
      department: json["department"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "department": department,
    };
  }

  static Future<List<Faculty>> fetchAll() async {
    String jsonData = await rootBundle.loadString('assets/faculty_data.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<Faculty> faculties = jsonList.map((json) {
      return Faculty(
        name: json["name"],
        email: json["email"],
        department: json["department"],
      );
    }).toList();
    return faculties;
  }
}

Future<List<Faculty>> loadFacultyFromAsset(String path) async {
  String jsonData = await rootBundle.loadString(path);
  List<dynamic> facultyData = json.decode(jsonData);
  return facultyData.map((json) => Faculty.fromJson(json)).toList();
}
