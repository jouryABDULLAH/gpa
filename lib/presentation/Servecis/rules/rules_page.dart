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

List<Rule> rules = [];

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
        title: Text(
          "rules_2".tr,
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
            child: Column(children: [Text("serv".tr), Text("serv_2".tr)]),
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

class RulesList extends StatefulWidget {
  const RulesList({super.key});

  @override
  State<RulesList> createState() => _RulesListState();
}

class _RulesListState extends State<RulesList> {
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
          rules[index].isExpanded = isExpanded;
        });
      },
      children: rules.map<ExpansionPanel>((Rule rule) {
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
                    Text("serv_st".tr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    for (int i = 0; i < rule.steps.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text('${i + 1}- ${rule.steps[i]}'),
                      ),
                  ],
                ),
                // trailing: const Icon(Icons.list),
                // onTap: () {
                //   // Handle onTap event
                // },
              ),
            ],
          ),
          isExpanded: rule.isExpanded,
        );
      }).toList(),
    );
  }
}
