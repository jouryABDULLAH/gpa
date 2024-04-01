import 'dart:convert';

import 'package:gpa/model/rules_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveRulesToSharedPreferences(List<Rules> rulesList) async {
  final prefs = await SharedPreferences.getInstance();
  final jsonList = rulesList.map((rule) => rule.toJson()).toList();
  final encodedJsonList = json.encode(jsonList);
  await prefs.setString('rulesData', encodedJsonList);
}

Future<List<Rules>> getRulesFromSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  final encodedJsonList = prefs.getString('rulesData');
  if (encodedJsonList != null) {
    final jsonList = json.decode(encodedJsonList);
    return jsonList.map<Rules>((json) => Rules.fromJson(json)).toList();
  }
  return [];
}
