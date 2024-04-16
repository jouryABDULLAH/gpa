// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/model/student_plan_model.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/Servecis/ProgramPlan/widgets/segment_button.dart';
class plan extends StatefulWidget {
  const plan({super.key});

  @override
  State<plan> createState() => _planState();
}

class _planState extends State<plan> {
  StudentPlanModel? studentPlan;
  bool isPlanCompletion = true;

  @override
  void initState() {
    super.initState();
    fetchStudentPlanData();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
       toolbarHeight: 90,
      title: Text(
            "student plan".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 40), // Align the text in the center
          ),
        centerTitle: true,
      backgroundColor: ColorManager.primary,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pop(); // This will navigate back to the previous screen
        },
      ),
      actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(children: [
              Container(
                height: media.width * 0.8,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 118, 192, 184).withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)
                  )
                ),
              ),
               Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                height: 50,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color.fromARGB(255, 118, 192, 184).withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(15)
                ),
                child:  Row(
                  children: [
                    Expanded(child: SegmentButton(title: "plan completion",  isActive: isPlanCompletion, onPressed: (){
                      if (mounted) {
                        setState(() {
                          isPlanCompletion = !isPlanCompletion;

                        });
                      }
                    })),

                    Expanded(child: SegmentButton(title: "plan details",  isActive: !isPlanCompletion, onPressed: (){
                      if (mounted) {
                        setState(() {
                          isPlanCompletion = !isPlanCompletion;

                        });
                      }
                    }))
                  ],
                ),
              )
          ],),
        ),
      ) 
      // Container(
      //   child: studentPlan == null
      //       ? const Center(child:  LinearProgressIndicator(backgroundColor: Colors.black))
      //       : buildPlanListView(),
      // ),
    );
  }

  Widget buildPlanListView() {
    return ListView.builder(
      itemCount: studentPlan!.levels.length,
      itemBuilder: (context, index) {
        var level = studentPlan!.levels.keys.toList()[index];
        var courses = studentPlan!.levels[level];
        return Column(
          children: [
            Text('Level: $level', style: const TextStyle(color: Colors.blue),),
            ListView.builder(
              shrinkWrap: true,
              itemCount: courses!.length,
              itemBuilder: (context, index) {
                var course = courses[index];
                return ListTile(
                  title: Text(course.name, style: const TextStyle(color: Colors.black),),
                  subtitle: Text(course.status, style: const TextStyle(color: Colors.black),),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void fetchStudentPlanData() async {
    try {
      StudentPlanModel studentPlanInfo =
          await StudentPlanModel.loadStudentPlan();

      setState(() {
        studentPlan = studentPlanInfo;
      });

      printData();
    } catch (e) {
      print("Error loading student plan data: $e");
    }
  }

  printData() {
    studentPlan?.levels.forEach((level, courses) {
  print('Level: $level');
  courses.forEach((course) {
    print('Course: ${course.name}, Status: ${course.status}');
    });
  });}
}



  