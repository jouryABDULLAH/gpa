import 'dart:convert';
import 'package:flutter/services.dart';

class Rules {
  String title;
  String url;
  String service_target;
  String description;
  List<String> steps;

  Rules(
      {required this.title,
      required this.url,
      required this.service_target,
      required this.description,
      required this.steps});

  factory Rules.fromJson(Map<String, dynamic> json) {
    return Rules(
        title: json['title'],
        url: json['url'],
        service_target: json['service-target'],
        description: json['description'],
        steps: List<String>.from(json['steps']));
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': url,
      'service_target': service_target,
      'description': description,
      'steps': steps
    };
  }

  static Future<List<Rules>> fetchAll() async {
    // Load JSON data from the assets folder
    String jsonData = await rootBundle.loadString('assets/rules_data.json');
    // Parse the JSON data
    List<dynamic> jsonList = json.decode(jsonData);
    // Convert JSON data into a list of Rule objects
    List<Rules> rules = jsonList.map((json) {
      List<String> steps = List<String>.from(json['steps']);
      return Rules(
        title: json['title'],
        description: json['description'],
        steps: steps,
        url: json['url'],
        service_target: json['service_target'],
      );
    }).toList();
    return rules;
  }
}

Future<List<Rules>> loadRulessFromAsset(String path) async {
  String jsonData = await rootBundle.loadString(path);
  List<dynamic> jsonList = json.decode(jsonData);

  List<Rules> rulesList = [];
  for (var json in jsonList) {
    Rules rule = Rules.fromJson(json);
    rulesList.add(rule);
  }
  return rulesList;
}
