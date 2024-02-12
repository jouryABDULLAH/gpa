// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gpa/presentation/home/home_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class chatbot_screen extends StatefulWidget {
  const chatbot_screen({super.key});

  @override
  State<chatbot_screen> createState() => _chatbot_screenState();
}

class _chatbot_screenState extends State<chatbot_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
        leading: IconButton(
          onPressed: () => Get.to(const HomeScreen()),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color.fromARGB(255, 15, 89, 149),
            size: 32,
          ),
        ),
        title: const Text(
          'مرحبًا, أنا الكابتن نامق',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 15, 89, 149)),
          // Align the text in the center
        ),
        toolbarHeight: 90.0,
      ),
      // body: ,
    );
  }
}
