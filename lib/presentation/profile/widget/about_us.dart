import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "University academic services are provided to the student to help them during their academic jour- ney. Academic advisors spend a lot of time and effort helping students achieve their academic goals and clearing up any confusion. However, because of their heavy workload, academic advisors may not always be able to respond to students promptly or provide them with better or more accurate information. As beneficial as they are, there are situations when the range of services and quantity of sources may cause problems for students searching for the right information and wind up distracting them. this project aims to provide students with a one-stop solution, providing all the resources a student may need in their academic journey. the project specifically provides five main features:a Chatbot, a conversational smart agent, an Interactive map, enhancing overall campus orienta- tion, a Digital ID, offering a convenient and secure means of identity verification, an Academic dashboard, notifying students of critical academic events, and provides Academic services such as GPA calculation and University rules page. This project aspires to help alleviate the challenges and difficulties faced by QU students, and to encourage the students’ intellectual growth and aca- demic achievement, reducing the load on academic advisors and University staff in the process.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
    );
  }
}
