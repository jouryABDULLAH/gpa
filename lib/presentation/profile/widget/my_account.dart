import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text(
          "معلوماتي",
          style: GoogleFonts.tajawal(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 167, 171)),
        ),
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
                                width: 200,
                                height: 35,
                                decoration:
                                    BoxDecoration(color: ColorManager.primary),
                                child: Text(
                                  "تغيير الايميل",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.tajawal(
                                      fontSize: 25,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
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
                                    hint: "كلمة المرور",
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
                                          child: Text(
                                            "حفظ",
                                            style: GoogleFonts.tajawal(
                                                fontSize: 20),
                                          ))),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                title: Text("تغيير الايميل",
                    style: GoogleFonts.tajawal(fontSize: 17)),
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
                                width: 200,
                                height: 30,
                                decoration:
                                    BoxDecoration(color: ColorManager.primary),
                                child: Text(
                                  "تغيير الاسم",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.tajawal(
                                      fontSize: 25,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  AppTextFormField(
                                    validate: (val) {
                                      if (val!.isEmpty) {
                                        return "يجب ملئ الحقل".tr;
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
                                          child: Text("حفظ",
                                              style: GoogleFonts.tajawal(
                                                  fontSize: 20)))),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                title: Text(
                  "تغيير الاسم",
                  style: GoogleFonts.tajawal(fontSize: 17),
                ),
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
