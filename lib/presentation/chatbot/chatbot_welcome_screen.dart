import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/chatbot/chatbotScreen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class ChatbotWelcome extends StatefulWidget {
  const ChatbotWelcome({Key? key});

  @override
  State<ChatbotWelcome> createState() => _ChatbotWelcomeState();
}

class _ChatbotWelcomeState extends State<ChatbotWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 50),
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    Text(
                      "WN".tr,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        MyLocal.getFontFamily(Get.locale!.languageCode),
                        color: Colors.white,
                        fontSize: Get.locale?.languageCode == 'ar' ? 35 : 28,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 50),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 150,
                            height: 180,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/captine.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: Text(
                              "hereforU".tr,
                              style: GoogleFonts.getFont(
                                  MyLocal.getFontFamily(
                                      Get.locale!.languageCode),
                                  color: Colors.white,
                                  fontWeight: Get.locale?.languageCode == 'ar'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: Get.locale?.languageCode == 'ar'
                                      ? 20
                                      : 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: ColorManager.white,
                        backgroundColor: ColorManager.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => const chatbotScreen());
                      },
                      child: Text(
                        "lets".tr,
                        style: GoogleFonts.getFont(
                          MyLocal.getFontFamily(Get.locale!.languageCode),
                          color: Colors.white,
                          fontSize: Get.locale?.languageCode == 'ar' ? 30 : 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
