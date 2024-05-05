import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/shared/component/text_form_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../control.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final controller = Get.put(Controller());
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            boxShadow: const [
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
            backgroundColor: ColorManager.primary,
            toolbarHeight: 88.0,
            actions: const [],
            centerTitle: true,
            title: Text(
              "pass".tr,
              style: GoogleFonts.getFont(
                MyLocal.getFontFamily(Get.locale!.languageCode),
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      body: Form(
        key: formState,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppTextFormField(
                  textStyle: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                  ),
                  validate: (val) {
                    if (val!.isEmpty) {
                      return "fill".tr;
                    }
                    if (val.length < 8) {
                      return "less".tr;
                    }
                    return null;
                  },
                  controller: currentPasswordController,
                  hint: "curr pass".tr,
                ),
                AppTextFormField(
                  textStyle: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                  ),
                  validate: (val) {
                    if (val!.isEmpty) {
                      return "fill".tr;
                    }
                    if (val.length < 8) {
                      return "less".tr;
                    }
                    return null;
                  },
                  controller: newPasswordController,
                  hint: "new pass".tr,
                ),
                AppTextFormField(
                  textStyle: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                  ),
                  validate: (val) {
                    if (val!.isEmpty) {
                      return "fill".tr;
                    }
                    if (val.length < 8) {
                      return "less".tr;
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  hint: "conf".tr,
                ),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(ColorManager.primary),
                          foregroundColor:
                              MaterialStateProperty.all(ColorManager.white),
                        ),
                        onPressed: () {
                          if (newPasswordController.text ==
                              confirmPasswordController.text) {
                            if (formState.currentState!.validate()) {
                              controller.changePassword(
                                  currentPasswordController.text,
                                  newPasswordController.text,
                                  context);
                              showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (_) => AlertDialog(
                                        title: Text("ch pass".tr,
                                            style: GoogleFonts.getFont(
                                              MyLocal.getFontFamily(
                                                  Get.locale!.languageCode),
                                            )),
                                        content: const Icon(
                                          Icons.task_alt,
                                          size: 80,
                                          color: Colors.green,
                                        ),
                                        actions: [
                                          Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "back".tr,
                                                  style: GoogleFonts.getFont(
                                                    MyLocal.getFontFamily(Get
                                                        .locale!.languageCode),
                                                  ),
                                                )),
                                          )
                                        ],
                                      ));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("ent pass".tr)));
                          }
                        },
                        child: Text(
                          "Save".tr,
                          style: GoogleFonts.getFont(
                            MyLocal.getFontFamily(Get.locale!.languageCode),
                            fontSize: 19,
                          ),
                        )))
              ],
            )),
      ),
    );
  }
}
