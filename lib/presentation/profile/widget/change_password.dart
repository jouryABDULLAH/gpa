import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(
        title: Text(
          'تغيير كلمة المرور',
          style: GoogleFonts.tajawal(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 167, 171),
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
                  validate: (val) {
                    if (val!.isEmpty) {
                      return "يجب تعبئة هذا الحقل";
                    }
                    if (val.length < 8) {
                      return "طول كلمة المرور لا يمكن ان يكون اقل من 8 ";
                    }
                    return null;
                  },
                  controller: currentPasswordController,
                  hint: "كلمة المرور الحالية",
                ),
                AppTextFormField(
                  validate: (val) {
                    if (val!.isEmpty) {
                      return "يجب تعبئة هذا الحقل";
                    }
                    if (val.length < 8) {
                      return "طول كلمة المرور لا يمكن ان يكون اقل من 8";
                    }
                    return null;
                  },
                  controller: newPasswordController,
                  hint: "كلمة المرور الجديدة",
                ),
                AppTextFormField(
                  validate: (val) {
                    if (val!.isEmpty) {
                      return "يجب تعبئة هذا الحقل";
                    }
                    if (val.length < 8) {
                      return "طول كلمة المرور لا يمكن ان يكون اقل من 8";
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  hint: "تأكيد كلمة المرور",
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
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
                                        title: Text(
                                          "تم تغيير كلمة المرور بنجاح",
                                          style: GoogleFonts.tajawal(),
                                        ),
                                        content: Icon(
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
                                                  "العودة للخلف",
                                                  style: GoogleFonts.tajawal(),
                                                )),
                                          )
                                        ],
                                      ));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "يجب ان تكون كلمة المرور المدخلة متساوية ")));
                          }
                        },
                        child: Text(
                          "حفظ",
                          style: GoogleFonts.tajawal(fontSize: 20),
                        )))
              ],
            )),
      ),
    );
  }
}
