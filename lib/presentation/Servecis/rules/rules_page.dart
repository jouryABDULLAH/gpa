import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/home/home_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/Servecis/rules/model/rules.dart';

// ignore: camel_case_types
class rulesPage extends StatefulWidget {
  const rulesPage({super.key});

  @override
  State<rulesPage> createState() => _rulesPageState();
}

// ignore: camel_case_types
class _rulesPageState extends State<rulesPage> {
  @override
  void initState() {
    super.initState();
    // Fetch the rules data when the screen is initialized
    fetchRulesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          onPressed: () => Get.to(const HomeScreen()),
          icon: const Icon(
            Icons.home,
            color: Colors.black,
            size: 32,
          ),
        ),
        title: const Text(
          'خدمات وقوانين الجامعة',
          textAlign: TextAlign.center, // Align the text in the center
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.notifications, color: Colors.black, size: 25),
          ),
        ],
        toolbarHeight: 90.0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
            child: const Column(children: [
              Text(' خدمات الجامعة'),
              Text('الخدمات المعروضة هي خدمات مقررة من الجامعة')
            ]),
          ),
          Container(
            height: 550,
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 30),
            child: const RulesList(),
          )
        ],
      ),
    );
  }

  void fetchRulesData() async {
    // Call the fetchAll method of the Rule class to fetch the data
    List<Rule> fetchedRules = await Rule.fetchAll();
    // Update the state with the fetched data
    setState(() {
      rules = fetchedRules;
    });
  }
}

List<Rule> rules = [];

//-------------------------------------------------
// stores ExpansionPanel state information

// class Rule {
//   Rule({
//     required this.title,
//     required this.description,
//     required this.videoLink,
//     this.isExpanded = false,
//   });

//   final String title;
//   final String description;
//   final String videoLink;
//   bool isExpanded;
// }

// final List<Rule> rules = [
//   Rule(
//     title: 'Title 1',
//     description: 'Description 1',
//     videoLink: 'Video Link 1',
//   ),
//   Rule(
//     title: 'Title 2',
//     description: 'Description 2',
//     videoLink: 'Video Link 2',
//   ),
//   // Add more rules as needed
// ];

//final rules = Rule.fetchAll();

// List<Rule> academicRules() {
//   return List<Rule>.from(rules);
// }

// List<Item> generateItems(int numberOfItems) {
//   return List<Item>.generate(numberOfItems, (int index) {
//     return Item(
//       headerValue: 'خدمة $index',
//       expandedValue: 'هذه الخدمة رقم  $index',
//     );
//   });
// }

class RulesList extends StatefulWidget {
  const RulesList({super.key});

  @override
  State<RulesList> createState() => _RulesListState();
}

class _RulesListState extends State<RulesList> {
  final List<Rule> _data = rules;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.all(2),
      animationDuration: const Duration(seconds: 1),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Rule rule) {
        return ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: ColorManager.card,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(rule.title),
            );
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 1, // Adjust the height of the divider
                color: const Color.fromARGB(
                    255, 9, 55, 92), // Customize the color of the divider
              ),
              ListTile(
                hoverColor: ColorManager.blue,
                title: Text(rule.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rule.description),
                    const SizedBox(
                        height:
                            8), // Add some space between description and steps
                    Text('خطوات تنفيذ الخدمة:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    for (String step in rule.steps)
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(step),
                      ),
                  ],
                ),
                trailing: const Icon(Icons.list),
                onTap: () {
                  // Handle onTap event
                },
              ),
            ],
          ),
          isExpanded: rule.isExpanded,
        );
      }).toList(),
    );
  }

  // Widget _buildPanel() {
  //   return ExpansionPanelList(
  //     expandedHeaderPadding: const EdgeInsets.all(2),
  //     animationDuration: const Duration(seconds: 1),
  //     expansionCallback: (int index, bool isExpanded) {
  //       setState(() {
  //         _data[index].isExpanded = isExpanded;
  //       });
  //     },
  //     children: _data.map<ExpansionPanel>((Rule rule) {
  //       return ExpansionPanel(
  //         canTapOnHeader: true,
  //         backgroundColor: ColorManager.card,
  //         headerBuilder: (BuildContext context, bool isExpanded) {
  //           return ListTile(
  //             title: Text(rule.title),
  //           );
  //         },
  //         body: Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             Container(
  //               height: 1, // Adjust the height of the divider
  //               color: const Color.fromARGB(
  //                   255, 9, 55, 92), // Customize the color of the divider
  //             ),
  //             ListTile(
  //                 hoverColor: ColorManager.blue,
  //                 title: Text(rules[index].title),
  //                 subtitle: Text(rules[index].description),
  //                 // هنا شرح الخدمة
  //                 // subtitle: const Text(
  //                 //     'هنا نجد تفاصيل الخدمة وتوضيحها وماهيتها الخ الخ الخ الخ الخ الخ ...'),
  //                 trailing: const Column(
  //                   children: [Icon(Icons.list), Text('خطوات تنفيذ الخدمة')],
  //                 ),
  //                 onTap: () {
  //                   // ignore: avoid_print
  //                   subtitle:
  //                   const Text(rule.steps);
  //                   print(rule.steps);
  //                   // setState(() {
  //                   //   // show the video on youtube
  //                   //   _data.removeWhere(
  //                   //       (Rule currentItem) => rule == currentItem);
  //                   // });
  //                 }),
  //           ],
  //         ),
  //         isExpanded: rule.isExpanded,
  //       );
  //     }).toList(),
  //   );
  // }
}
