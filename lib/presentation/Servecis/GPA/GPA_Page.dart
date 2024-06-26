import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/home/home_screen.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/grade_average_page.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/grade_average_page_TR.dart';

class GPAPage extends StatefulWidget {
  const GPAPage({super.key});

  @override
  State<GPAPage> createState() => _GPAPage();
}

class _GPAPage extends State<GPAPage> {
  final style = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Upper(),
          const SizedBox(
            height: 12,
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
      "GPA_1".tr,
      "GPA_2".tr,
    ];

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(19),
          bottomRight: Radius.circular(19),
        ),
        color: Colors.white,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          mainAxisSpacing: 15,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (index == 0) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const GradeAveragePage()),
                );
              } else if (index == 1) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const GradeAveragePageTR()),
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: const Color.fromARGB(255, 0, 167, 171),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(44, 0, 0, 0),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    index == 0 ? Boxicons.bx_book : Boxicons.bx_award,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    Titles[index],
                    style: GoogleFonts.getFont(
                        MyLocal.getFontFamily(Get.locale!.languageCode),
                        color: Colors.white,
                        fontSize: Get.locale?.languageCode == 'ar' ? 20 : 18,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget Upper() {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 168, 171),
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
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25.0,
              ),
              padding: const EdgeInsets.all(0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "GPA".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  textStyle: const TextStyle(
                    fontSize: 40,
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
