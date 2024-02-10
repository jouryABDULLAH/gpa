import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:gpa/presentation/Servecis/ServecisPage.dart';
>>>>>>> HI
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/grade_average_page.dart';

class GPAPage extends StatefulWidget {
  const GPAPage({super.key});

  @override
  State<GPAPage> createState() => _GPAPage();
}

class _GPAPage extends State<GPAPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        leading: IconButton(
<<<<<<< HEAD
          onPressed: () {},
          icon: Icon(
            Icons.list,
            color: Colors.black,
            size: 32,
          ),
=======
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ServicisPage()),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25.0,
          ),
          padding: EdgeInsets.all(0),
>>>>>>> HI
        ),
        actions: [
          IconButton(
            onPressed: () {},
<<<<<<< HEAD
            icon: Icon(Icons.notifications, color: Colors.black, size: 25),
=======
            icon: Icon(Icons.notifications, color: Colors.white, size: 25),
>>>>>>> HI
          ),
        ],
      ),
      body: Column(
        children: [
<<<<<<< HEAD
          const Image(image: AssetImage("assets/images/Acadmic Servecis.png")),
=======
          Upper(), // const Image(image: AssetImage("assets/images/Acadmic Servecis.png")),
>>>>>>> HI
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
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
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
                      builder: (context) => const GradeAveragePage()),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(90, 0, 168, 171),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Icon(IconsItems[index]),
                  Text(Titles[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
<<<<<<< HEAD
=======

  Widget Upper() {
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
              " المعدل ",
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
>>>>>>> HI
}
