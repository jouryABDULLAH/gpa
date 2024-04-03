import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/presentation/foreget_password.dart';
import 'package:gpa/presentation/sign_up/sign_up_screen.dart';
import '../create.dart';
import '../../shared/component/app_button.dart';
import '../../shared/component/text_form_field.dart';
import '../../../control.dart';
import '../resources/color_manager.dart';
import '../resources/responsive.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({super.key});

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

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
                  image: AssetImage("assets/images/Sign_up_page.png"),
                  fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.all(20),
              height: responsive.sHeight(context) / 1.55,
              width: responsive.sWidth(context) - 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: nameKey,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          backgroundColor: ColorManager.primary,
                          child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Get.back();
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "welcome".tr,
                        style: GoogleFonts.vidaloka(
                          textStyle: TextStyle(
                            fontSize: 39,
                            color: Color.fromARGB(255, 0, 167, 171),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "Email",
                        controller: email,
                        validate: (c) {
                          if (!email.text.contains("@")) {
                            return "wrong".tr;
                          }
                          return null;
                        },
                        hint: '411900000@qu.edu.sa',
                        textStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 108, 108, 108),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "Password",
                        controller: password,
                        validate: (c) {
                          if (password.text.length < 8) return "less 8".tr;
                          return null;
                        },
                        hint: '********',
                        textStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 108, 108, 108),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      controller.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.perf,
                              ),
                            )
                          : Center(
                              child: AppButton(
                                height: 48,
                                width: 200,
                                content: Text(
                                  'Login'.tr,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                contentClr: Colors.white,
                                clr: Color.fromARGB(255, 0, 167, 171),
                                onPressed: () async {
                                  if (nameKey.currentState?.validate() ==
                                      true) {
                                    setState(() {
                                      controller.isLoading = true;
                                    });
                                    await Si()
                                        .submitAuthForm(
                                      email: email.text.trim(),
                                      password: password.text.trim(),
                                      isLogin: true,
                                      ctx: context,
                                      signWith: "email",
                                    )
                                        .then((value) {
                                      if (mounted) {
                                        setState(() {
                                          controller.isLoading = false;
                                        });
                                      }
                                    });
                                  }
                                },
                              ),
                            ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Get.to(const ForgetPassword());
                            },
                            child: Text(
                              "forget".tr,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 0, 81, 154),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Get.to(const SignUpWidget());
                            },
                            child: Text(
                              "sign up".tr,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 0, 81, 154),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )),
                      )
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
