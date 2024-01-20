import 'package:flutter/material.dart';
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
          onPressed: () {},
          icon: Icon(
            Icons.list,
            color: Colors.black,
            size: 32,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.black, size: 25),
          ),
        ],
      ),
      body: Column(
        children: [
          const Image(image: AssetImage("assets/images/Acadmic Servecis.png")),
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
}
