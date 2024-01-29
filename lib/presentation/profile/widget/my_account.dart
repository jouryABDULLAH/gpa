import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/model/user_model.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/shared/component/text_form_field.dart';

import '../../../control.dart';

class MyAccount extends StatefulWidget {
  MyAccount({super.key, required this.userData});

  final UserModel userData;

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final controller = Get.put(Controller());

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.userData.name);
    emailController = TextEditingController(text: widget.userData.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Account"),
        ),
        body: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppTextFormField(
                  controller: nameController,
                  hint: widget.userData.name,
                ),
                AppTextFormField(
                  validate: (val) {
                    if (!val!.contains("@qu.edu.sa")) {
                      return "must contains @qu.edu.sa".tr;
                    }
                    return null;
                  },
                  controller: emailController,
                  hint: widget.userData.email,
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
                          if (formState.currentState!.validate()) {
                            controller.updateUserData(
                                userName: nameController.text,
                                email: emailController.text,
                                context: context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text("account updated success")));
                          }
                        },
                        child: const Text("Save")))
              ],
            ),
          ),
        ));
  }
}
