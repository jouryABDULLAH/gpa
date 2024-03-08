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
          padding: EdgeInsets.fromLTRB(50, 20, 50, 10),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Sign_up_page.png"),
                  fit: BoxFit.fill)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 110),
              const Text(
                'مرحبًا, أنا نامق',
                style: TextStyle(color: Colors.white, fontSize: 25),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 75),
              Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // padding: const EdgeInsets.only(left: 15, right: 50),
                        margin: const EdgeInsets.only(bottom: 10),
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
                      const Center(
                        child: Text(
                          'هنا لمساعدتك على إيجاد إجابات لتساؤلاتك حول الخدمات الأكديمية وما يخص الجامعة ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 80),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: ColorManager.white,
                    backgroundColor: ColorManager.primary,
                    // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Get.to(() => const chatbot_screen());
                  print('clicked');
                },
                child: const Text(
                  'دعنا نتحدث!',
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
