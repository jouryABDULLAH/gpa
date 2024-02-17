import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:gpa/presentation/Servecis/ServecisPage.dart';
=======
import 'package:google_fonts/google_fonts.dart';
>>>>>>> origin/test
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
      appBar: AppBar(
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
<<<<<<< HEAD
            Icons.arrow_back,
            color: Colors.white,
            size: 25.0,
=======
            Icons.list,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 32,
>>>>>>> origin/test
          ),
          padding: EdgeInsets.all(0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
<<<<<<< HEAD
            icon: Icon(Icons.notifications, color: Colors.white, size: 25),
=======
            icon: Icon(Icons.notifications,
                color: Color.fromARGB(255, 255, 255, 255), size: 25),
>>>>>>> origin/test
          ),
        ],
      ),
      body: Column(
        children: [
<<<<<<< HEAD
          Upper(), // const Image(image: AssetImage("assets/images/Acadmic Servecis.png")),
=======
          Upper("المعدل"), // Place Upper widget at the top
>>>>>>> origin/test
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
      "فصلي",
      "تراكمي",
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

<<<<<<< HEAD
  Widget Upper() {
=======
  Widget Upper(String text) {
>>>>>>> origin/test
    return Container(
      padding: const EdgeInsets.only(bottom: 50),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 168, 171),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
<<<<<<< HEAD
              " المعدل ",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
=======
              upper(text), // Use the custom function
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontFamily: GoogleFonts.tajawal().fontFamily,
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
>>>>>>> origin/test
            ),
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
=======

  String upper(String text) {
    // Your custom function to convert text to uppercase
    return text.toUpperCase();
  }
>>>>>>> origin/test
}
