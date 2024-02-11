import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/chatbot/chatbot_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class chatbo_welcome extends StatefulWidget {
  const chatbo_welcome({super.key});

  @override
  State<chatbo_welcome> createState() => _chatbo_welcomeState();
}

class _chatbo_welcomeState extends State<chatbo_welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Sign_up_page.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            const Text('مرحبًا, أنا نامق'),
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/captine.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
                'here to help answer your questions regarding university services!'),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: ColorManager.white,
                backgroundColor: ColorManager.primary,
              ),
              onPressed: () {
                () => Get.to(() => const chatbot_screen());
              },
              child: const Text('دعنا نتحدث!'),
            )
          ],
        ),
      ),
    ));
  }
}
