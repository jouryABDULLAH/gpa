import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import '../../shared/component/app_button.dart';
import '../../shared/component/text_form_field.dart';
import 'resources/color_manager.dart';
import 'resources/responsive.dart';
import '../../control.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.all(10),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
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
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "forgpage".tr,
                        style: GoogleFonts.vidaloka(
                          textStyle: TextStyle(
                            fontSize: 39,
                            color: Color.fromARGB(255, 0, 167, 171),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "forgpage1".tr,
                        style: GoogleFonts.vidaloka(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 108, 108, 108),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "Email".tr,
                        controller: email,
                        validate: (c) {
                          if (!email.text.contains("@")) {
                            return "wrong email".tr;
                          }
                          if (email.text.trim().isEmpty) {
                            return "empty".tr;
                          }
                          return null;
                        },
                        hint: "enter your email".tr,
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
                                  "send".tr,
                                  style: GoogleFonts.getFont(
                                    MyLocal.getFontFamily(
                                        Get.locale!.languageCode),
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                contentClr: Colors.white,
                                clr: ColorManager.primary,
                                onPressed: () async {
                                  try {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                            email: email.text);

                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      title: '',
                                      desc: "mess".tr,
                                    ).show();
                                  } catch (e) {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: "erroroccured".tr,
                                      desc: "erroroccured2".tr +
                                          "${email.text}" +
                                          "TA".tr,
                                    ).show();
                                  }
                                },
                              ),
                            ),
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
