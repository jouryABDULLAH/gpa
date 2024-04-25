import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    const SizedBox(height: 200),
                    Text(
                      'مرحبًا، نامق في خدمتك!',
                      style: GoogleFonts.almarai(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 75),
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
                              'هنا لمساعدتك على إيجاد إجابات لتساؤلاتك حول الخدمات الأكديمية وما يخص الجامعة ',
                              style: GoogleFonts.almarai(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
                        '!دعنا نتحدث',
                        style: GoogleFonts.almarai(
                          color: Colors.white,
                          fontSize: 30,
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
