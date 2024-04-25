

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/logIn/login_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/resources/responsive.dart';
import 'package:gpa/presentation/sign_up/sign_up_screen.dart';
import 'package:gpa/shared/component/app_button.dart';
import '../../control.dart';

/*
 Text(
                        "welcome".tr,
                        style: GoogleFonts.vidaloka(
                          textStyle: TextStyle(
                            fontSize: 36,
                            color: Color.fromARGB(255, 0, 167, 171),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),*/

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController username = TextEditingController();

  bool show = false;

  final controller = Get.put(Controller());

  final nameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/welcome.gif"),
                  fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: responsive.sHeight(context) / 2.7,
              decoration: const BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: nameKey,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      AppButton(
                        height: 58,
                        width: 300,
                        content: Text(
                          "Login".tr,
                          style: GoogleFonts.getFont(
                            MyLocal.getFontFamily(Get.locale!.languageCode),
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        clr: Color.fromARGB(253, 17, 54, 90),
                        onPressed: () {
                          Get.to(const LogInWidget());
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Dacc".tr,
                        style: GoogleFonts.getFont(
                          MyLocal.getFontFamily(Get.locale!.languageCode),
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 22, 49, 81),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(const SignUpWidget());
                          },
                          child: Text(
                            "sign up".tr,
                            style: GoogleFonts.getFont(
                              MyLocal.getFontFamily(Get.locale!.languageCode),
                              textStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 247, 6, 6),
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
