import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/home/home_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/Servecis/rules/model/rules.dart';
import 'package:gpa/presentation/Servecis/ServecisPage.dart';

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
    fetchRulesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(75, 0, 0, 0),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: ColorManager.primary,
            toolbarHeight: 99.0,
            actions: [],
            centerTitle: true,
            title: Text(
              "rules".tr,
              style: GoogleFonts.getFont(
                MyLocal.getFontFamily(Get.locale!.languageCode),
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .pop(); // This will navigate back to the previous screen
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Column(children: [
              Text(
                "serv".tr,
                style: GoogleFonts.getFont(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 81, 154),
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "serv_2".tr,
                style: GoogleFonts.getFont(
                  fontSize: Get.locale?.languageCode == 'ar' ? 14 : 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 0, 81, 154),
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                ),
              )
            ]),
          ),
          Container(
            height: 620,
            //color: ColorManager.primary,
            margin:
                const EdgeInsets.only(top: 2, right: 8, bottom: 10, left: 8),
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
        padding: const EdgeInsets.all(10),
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
      dividerColor: Color.fromARGB(255, 0, 81, 154),
      children: rules.map<ExpansionPanel>((Rule rule) {
        return ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: Color.fromARGB(255, 236, 236, 236),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              iconColor: Color.fromARGB(255, 0, 81, 154),
              title: Text(
                rule.title,
                style: GoogleFonts.almarai(
                  color: Color.fromARGB(255, 1, 42, 76),
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 0.8,
                color: const Color.fromARGB(255, 0, 81, 154),
              ),
              ListTile(
                hoverColor: Color.fromARGB(255, 0, 81, 154),
                title: Text(rule.title,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.almarai(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 42, 76))),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(rule.description,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.almarai(
                            color: Color.fromARGB(255, 0, 81, 154))),
                    const SizedBox(height: 9),
                    Text(
                      "خطوات تنفيذ الخدمة:",
                      style: GoogleFonts.tajawal(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 42, 76),
                      ),
                    ),
                    for (int i = 0; i < rule.steps.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Text(
                          textAlign: TextAlign.right,
                          '${i + 1}- ${rule.steps[i]}',
                          style: GoogleFonts.almarai(
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 0, 81, 154),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          isExpanded: rule.isExpanded,
        );
      }).toList(),
    );
  }
}
