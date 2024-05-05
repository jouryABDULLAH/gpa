import 'dart:convert';
import 'package:flutter/services.dart';

class Rules {
  String title;
  String? url;
  List<String> service_target;
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
      title: json["title"] ?? "",
      url: json["url"] ?? "--",
      service_target: (json["service-target"] as List<dynamic>?)
              ?.map((target) => target.toString())
              .toList() ??
          [],
      description: json["description"] ?? "",
      steps: (json["steps"] as List<dynamic>?)
              ?.map((step) => step.toString())
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "url": url,
      "service-target": service_target,
      "description": description,
      "steps": steps
    };
  }

  static Future<List<Rules>> fetchAll() async {
    String jsonData = await rootBundle.loadString('assets/rules_data.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<Rules> rules = jsonList.map((json) {
      List<String> steps = List<String>.from(json["steps"]);
      List<String> service_target = List<String>.from(json["service-target"]);
      return Rules(
        title: json["title"],
        description: json["description"],
        steps: steps,
        url: json["url"],
        service_target: service_target,
      );
    }).toList();
    return rules;
  }

  static Future<List<Rules>> loadRulessFromAsset(String path) async {
    String jsonData = await rootBundle.loadString(path);
    List<dynamic> jsonList = json.decode(jsonData);

    List<Rules> rulesList = [];
    for (var json in jsonList) {
      Rules rule = Rules.fromJson(json);
      rulesList.add(rule);
    }
    return rulesList;
  }
}
