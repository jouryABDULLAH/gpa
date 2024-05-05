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
    String jsonData = await rootBundle.loadString('assets/rules_data.json');
    List<dynamic> jsonList = json.decode(jsonData);
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
