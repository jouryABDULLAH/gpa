import 'dart:convert';
import 'package:flutter/services.dart';


class CourseModel {
  String name;
  String status;
  int? hours;

  CourseModel({required this.name, required this.status});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      name: json['name'],
      status: json['status'],
    );
  }
}