import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local_controller.dart';
import '../../control.dart';
import '../create.dart';
import '../../shared/component/app_button.dart';
import '../../shared/component/text_form_field.dart';
import '../resources/color_manager.dart';
import '../resources/responsive.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController password1 = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();

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
              height: responsive.sHeight(context) / 1.15,
              width: responsive.sWidth(context) - 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: nameKey,
                  child: Column(
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
                        height: 2,
                      ),
                      Text(
                        "Nice".tr,
                        style: GoogleFonts.vidaloka(
                          textStyle: const TextStyle(
                            fontSize: 34,
                            color: Color.fromARGB(255, 0, 167, 171),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "Name".tr,
                        controller: name,
                        hint: "name".tr,
                        validate: (c) {
                          if (name.text.trim().isEmpty) {
                            return "empty".tr;
                          }
                          if (c!.contains(RegExp("[a-z,A-Z]"))) {
                            return "wroname".tr;
                          }

                          return null;
                        },
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
                          if (!email.text.contains("qu.edu.sa")) {
                            return "most".tr;
                          }
                          return null;
                        },
                        hint: 'email'.tr,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "University ID".tr,
                        controller: id,
                        hint: "UID".tr,
                        validate: (c) {
                          if (id.text.trim().isEmpty) {
                            return "empty".tr;
                          }
                          if (c!.isEmpty) {
                            return "empty".tr;
                          }

                          if (id.text.length < 9) {
                            return "lessi".tr;
                          }
                          if (double.tryParse(id.text) == null) {
                            return "notNum".tr;
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "Password".tr,
                        controller: password,
                        validate: (c) {
                          if (password.text.length < 8) return "less".tr;
                          return null;
                        },
                        hint: 'password'.tr,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "conf".tr,
                        controller: password1,
                        validate: (c) {
                          if (password.text.length < 8) {
                            return "less".tr;
                          }
                          if (password.value != password1.value) {
                            return "equals".tr;
                          } else {
                            return null;
                          }
                        },
                        hint: 'Confpassword'.tr,
                      ),
                      const SizedBox(
                        height: 16,
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
                                  "sign up".tr,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                contentClr: Colors.white,
                                clr: ColorManager.primary,
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
                                      isLogin: false,
                                      ctx: context,
                                      name: name.text.trim(),
                                      id: id.text.trim(),
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
