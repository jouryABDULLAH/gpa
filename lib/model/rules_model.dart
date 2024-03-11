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
      'service-target': service_target,
      'description': description,
      'steps': steps
    };
  }
}

// Future<List<Rules>> loadRulessFromAsset(String path) async {
//   String jsonData = await rootBundle.loadString(path);
//   Map<String, dynamic> jsonMap = json.decode(jsonData);
//   List<dynamic> rulesData = jsonMap['rules'];
//   return rulesData.map((json) => Rules.fromJson(json)).toList();
// }

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
