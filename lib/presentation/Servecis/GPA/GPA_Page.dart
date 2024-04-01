import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/presentation/Servecis/ServecisPage.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/grade_average_page.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/grade_average_page_TR.dart';

class GPAPage extends StatefulWidget {
  const GPAPage({super.key});

  @override
  State<GPAPage> createState() => _GPAPage();
}

class _GPAPage extends State<GPAPage> {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ServicisPage()),
            );
          },
          icon: Icon(
            Icons.list,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 32,
          ),
          padding: EdgeInsets.all(0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications,
                color: Color.fromARGB(255, 255, 255, 255), size: 25),
          ),
        ],
      ),*/
      body: Column(
        children: [
          Upper(), // Place Upper widget at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(19),
          bottomRight: Radius.circular(19),
        ),
        color: Colors.white,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          mainAxisSpacing: 25,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
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
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: Color.fromARGB(90, 0, 167, 171),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(IconsItems[index]),
                  Text(
                    Titles[index],
                    style: GoogleFonts.tajawal(
                        textStyle: style,
                        color: Color.fromARGB(255, 255, 255, 255)),
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
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25.0,
              ),
              padding: EdgeInsets.all(0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "GPA".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
