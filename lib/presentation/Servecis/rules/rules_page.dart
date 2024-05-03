import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/home/home_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/Servecis/rules/model/rules.dart';
import 'package:gpa/presentation/Servecis/ServecisPage.dart';

// ignore: camel_case_types
class RulesPage extends StatefulWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  State<RulesPage> createState() => _RulesPageState();
}

List<Rule> rules = [];

// ignore: camel_case_types
class _RulesPageState extends State<RulesPage> {
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
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
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
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: RulesList(),
            ),
          ),
        ],
      ),
    );
  }

  void fetchRulesData() async {
    List<Rule> fetchedRules = await Rule.fetchAll();
    setState(() {
      rules = fetchedRules;
    });
  }
}

class RulesList extends StatefulWidget {
  const RulesList({Key? key}) : super(key: key);

  @override
  State<RulesList> createState() => _RulesListState();
}

class _RulesListState extends State<RulesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rules.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(
            rules[index].title,
            style: GoogleFonts.almarai(
              color: Color.fromARGB(255, 1, 42, 76),
              fontWeight: FontWeight.w400,
            ),
          ),
          children: [
            ListTile(
              title: Text(
                rules[index].description,
                style: GoogleFonts.almarai(
                  color: Color.fromARGB(255, 0, 81, 154),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "serv_st".tr,
                    style: GoogleFonts.getFont(
                      MyLocal.getFontFamily(Get.locale!.languageCode),
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 1, 42, 76),
                    ),
                  ),
                  for (int i = 0; i < rules[index].steps.length; i++)
                    Text(
                      '${i + 1}- ${rules[index].steps[i]}',
                      style: GoogleFonts.almarai(
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 0, 81, 154),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
