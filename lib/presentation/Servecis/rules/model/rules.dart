import 'dart:convert';
import 'package:flutter/services.dart';

class Rule {
  final String title;
  final String description;
  final List<String> steps;
  bool isExpanded;

  Rule({
    required this.title,
    required this.description,
    required this.steps,
    this.isExpanded = false,
  });

  static Future<List<Rule>> fetchAll() async {
    // Load JSON data from the assets folder
    String jsonData = await rootBundle.loadString('assets/rules_data.json');
    // Parse the JSON data
    List<dynamic> jsonList = json.decode(jsonData);
    // Convert JSON data into a list of Rule objects
    List<Rule> rules = jsonList.map((json) {
      List<String> steps = List<String>.from(json['steps']);
      return Rule(
        title: json['title'],
        description: json['description'],
        steps: steps,
      );
    }).toList();
    return rules;
  }
}
