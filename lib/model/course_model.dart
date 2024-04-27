import 'dart:convert';
import 'package:flutter/services.dart';


class CourseModel {
  String name;
  String status;
  String hours;
  String type;


  CourseModel({required this.name, required this.status, required this.hours, required this.type});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      name: json['name'],
      status: json['status'],
      hours: json['hours'],
      type: json['type'],
    );
  }
}