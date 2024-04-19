import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gpa/model/course_model.dart';

class StudentPlanModel {
  Map<String, List<CourseModel>> levels;

  StudentPlanModel({required this.levels});

  factory StudentPlanModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<CourseModel>> levels = {};
    json.forEach((key, value) {
      List<CourseModel> courses = [];
      value.forEach((courseJson) {
        courses.add(CourseModel.fromJson(courseJson));
      });
      levels[key] = courses;
    });
    return StudentPlanModel(levels: levels);
  }

  static Future<StudentPlanModel> loadStudentPlan() async {
    String jsonString = await rootBundle.loadString('assets/student_plan.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    return StudentPlanModel.fromJson(jsonData);
  }
}



