// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class aboutProgram extends StatefulWidget {
  const aboutProgram({super.key});

  @override
  State<aboutProgram> createState() => __aboutProgramState();
}

class __aboutProgramState extends State<aboutProgram> {
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
            toolbarHeight: 90,
            title: Text(
              "About program".tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                MyLocal.getFontFamily(Get.locale!.languageCode),
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: ColorManager.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .pop(); // This will navigate back to the previous screen
              },
            ),
            actions: [],
          ),
        ),
      ),
      body: Container(
        foregroundDecoration: const BoxDecoration(color: Colors.white),
      ),
    );
  }
}
