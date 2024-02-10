import 'dart:convert';
import 'dart:io';

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
    // Read the JSON file from the file system
    File file = File(
        'lib/shared/data/data_encoded.json'); // Replace 'path_to_your_shared_folder' with the actual path
    String jsonData = await file.readAsString();

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



// import 'dart:convert';

// class Rule {
//   final String title;
//   final String description;
//   final String steps;
//   bool isExpanded;

//   Rule({
//     required this.title,
//     required this.description,
//     required this.steps,
//     this.isExpanded = false,
//   });

//   static List<Rule> fetchAll() {
//     return [
//       Rule(title: 'title1', description: 'description1', steps: 'steps1'),
//       Rule(title: 'title1', description: 'description1', steps: 'steps1'),
//       Rule(title: 'title1', description: 'description1', steps: 'steps1'),
//       Rule(title: 'title1', description: 'description1', steps: 'steps1'),
//       Rule(title: 'title1', description: 'description1', steps: 'steps1'),
//       Rule(title: 'title1', description: 'description1', steps: 'steps1'),
//       Rule(title: 'title1', description: 'description1', steps: 'steps1'),
//     ];
//   }
// }
