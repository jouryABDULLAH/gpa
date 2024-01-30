import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/model/user_model.dart';
import 'package:gpa/presentation/profile/profile_screen.dart';
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

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    emailController = TextEditingController(text: widget.userData.email);
    nameController = TextEditingController(text: widget.userData.name);
    super.initState();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
    /*    leading: IconButton(
          onPressed: () {
            Get.to(ProfileScreen());
          },
          icon: Icon(Icons.arrow_back),
        ),*/
      ),
      body: GetBuilder<Controller>(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Form(
                        key: formState,
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
                                decoration:
                                    BoxDecoration(color: ColorManager.primary),
                                child: const Text(
                                  "Change Email",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  AppTextFormField(
                                    validate: (val) {
                                      if (!val!.contains("@qu.edu.sa")) {
                                        return "must contains @qu.edu.sa";
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    hint: widget.userData.email,
                                  ),
                                  AppTextFormField(
                                    controller: passwordController,
                                    hint: "password",
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    ColorManager.primary),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    ColorManager.white),
                                          ),
                                          onPressed: () {
                                            if (formState.currentState!
                                                .validate()) {
                                              controller.updateEmail(
                                                  password:
                                                      passwordController.text,
                                                  email: emailController.text,
                                                  context: context);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      content: Text(
                                                          "account updated success")));
                                            }
                                          },
                                          child: const Text("Save"))),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                title: const Text("Change Email"),
                leading: const Icon(Icons.email),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.primary,
                ),
              ),
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Form(
                        key: formState,
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
                                decoration:
                                    BoxDecoration(color: ColorManager.primary),
                                child: const Text(
                                  "Change Name",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  AppTextFormField(
                                    validate: (val) {
                                      if (val!.isEmpty) {
                                        return "cant be empty".tr;
                                      }
                                      if (val.contains(RegExp("[a-z,A-Z]"))) {
                                        return "يجب ان يكون الاسم باللغة العربية"
                                            .tr;
                                      }
                                      return null;
                                    },
                                    controller: nameController,
                                    hint: widget.userData.name,
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    ColorManager.primary),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    ColorManager.white),
                                          ),
                                          onPressed: () async {
                                            if (formState.currentState!
                                                .validate()) {
                                              await controller.updateName(
                                                  userName: nameController.text,
                                                  context: context);
                                              /* ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      content: Text(
                                                          "account updated success")));*/
                                            }
                                          },
                                          child: const Text("Save"))),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                title: const Text("Change Name"),
                leading: const Icon(Icons.person),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
