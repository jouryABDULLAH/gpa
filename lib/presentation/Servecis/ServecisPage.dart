import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/home/home_screen.dart';
import 'package:gpa/presentation/Servecis/AboutProgram/aboutProgram.dart';
import 'package:gpa/presentation/Servecis/AcademicAdvisor/AcademicAdvisor.dart';
import 'package:gpa/presentation/Servecis/ProgramPlan/plan.dart';
import 'package:gpa/presentation/home/home_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/Servecis/GPA/GPA_Page.dart';
import 'package:gpa/presentation/Servecis/rules/rules_page.dart';
import 'package:boxicons/boxicons.dart';

class ServicisPage extends StatefulWidget {
  const ServicisPage({Key? key});

  @override
  State<ServicisPage> createState() => _ServicisPage();
}

class _ServicisPage extends State<ServicisPage> {
  final style = const TextStyle(fontSize: 30, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        actions: [],
      ),
      body: Column(
        children: [
          Upper(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: MyList(),
          ),
        ],
      ),
    );
  }

  Widget MyList() {
    List<String> Titles = [
      "GPA".tr,
      "rules".tr,
      "student plan".tr,
      "About program".tr,
      "Academic advisor".tr,
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        mainAxisSpacing: 15,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (index == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const GPAPage()),
              );
            } else if (index == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const rulesPage()),
              );
            } else if (index == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const plan()),
              );
            } else if (index == 3) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const aboutProgram()),
              );
            } else if (index == 4) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const AcademicAdvisorePage()),
              );
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              color: Color.fromARGB(255, 0, 167, 171),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(44, 0, 0, 0),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  index == 0
                      ? Boxicons.bx_calculator
                      : index == 1
                          ? Boxicons.bx_book_open
                          : index == 2
                              ? Boxicons.bx_notepad
                              : index == 3
                                  ? Boxicons.bx_info_square
                                  : Boxicons.bx_user_pin,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  textAlign: TextAlign.center,
                  Titles[index],
                  style: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                    fontSize: Get.locale?.languageCode == 'ar' ? 20 : 18,
                    textStyle: style,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget Upper() {
    return Container(
      padding: const EdgeInsets.only(bottom: 50),
      height: 120,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 167, 171),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(75, 0, 0, 0),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "servpage".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  textStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
