import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/shared/component/text_form_field.dart';

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
        title: const Text("Change Password"),
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
                      return "this field cant be empty";
                    }
                    if (val.length < 8) {
                      return "password cant be less than 8 letter";
                    }
                    return null;
                  },
                  controller: currentPasswordController,
                  hint: "current password",
                ),
                AppTextFormField(
                  validate: (val) {
                    if (val!.isEmpty) {
                      return "this field cant be empty";
                    }
                    if (val.length < 8) {
                      return "password cant be less than 8 letter";
                    }
                    return null;
                  },
                  controller: newPasswordController,
                  hint: "new password",
                ),
                AppTextFormField(
                  validate: (val) {
                    if (val!.isEmpty) {
                      return "this field cant be empty";
                    }
                    if (val.length < 8) {
                      return "password cant be less than 8 letter";
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  hint: "confirm password",
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
                                            "password changed successfully"),
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
                                                }, child: Text("Go Back")),
                                          )
                                        ],
                                      ));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "new password must equal confirm password")));
                          }
                        },
                        child: const Text("Save")))
              ],
            )),
      ),
    );
  }
}
