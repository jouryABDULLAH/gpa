import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class AcademicAdvisorePage extends StatefulWidget {
  const AcademicAdvisorePage({super.key});

  @override
  State<AcademicAdvisorePage> createState() => __AcademicAdvisorePagStateState();
}

class __AcademicAdvisorePagStateState extends State<AcademicAdvisorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0,
       toolbarHeight: 90,
      title: Text(
            "student plan".tr,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 50), // Align the text in the center
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

      body: Container(
        foregroundDecoration: const BoxDecoration(color: Colors.white),
      ),
    );
  }
}