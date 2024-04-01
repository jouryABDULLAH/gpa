import 'dart:convert';
import 'package:flutter/services.dart';

class Faculty {
  String name;
  String email;
  String department;

  Faculty({required this.name, required this.email, required this.department});

  factory Faculty.fromJson(Map<String, dynamic> json) {
    return Faculty(
      name: json['name'],
      email: json['email'],
      department: json['department'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'department': department,
    };
  }
}

Future<List<Faculty>> loadFacultyFromAsset(String path) async {
  String jsonData = await rootBundle.loadString(path);
  List<dynamic> facultyData = json.decode(jsonData);
  return facultyData.map((json) => Faculty.fromJson(json)).toList();
}
