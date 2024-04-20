import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/model/user_model.dart';
import 'package:gpa/presentation/profile/profile_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/shared/component/text_form_field.dart';
import 'package:icons_plus/icons_plus.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            boxShadow: [
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
            actions: [],
            centerTitle: true,
            title: Text(
              "info".tr,
              style: GoogleFonts.getFont(
                MyLocal.getFontFamily(Get.locale!.languageCode),
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<Controller>(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text(
                  "Name:".tr + " " + (controller.me?.name ?? ""),
                  style: GoogleFonts.almarai(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: const Icon(BoxIcons.bxs_user_detail),
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
                                height: 43,
                                decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    )),
                                child: Text(
                                  "change e".tr,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                      MyLocal.getFontFamily(
                                          Get.locale!.languageCode),
                                      fontSize: 25,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  AppTextFormField(
                                    textStyle: GoogleFonts.getFont(
                                      MyLocal.getFontFamily(
                                          Get.locale!.languageCode),
                                    ),
                                    validate: (val) {
                                      if (!val!.contains("@qu.edu.sa")) {
                                        return "must contains @qu.edu.sa";
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    hint: widget.userData.email,
                                  ),
                                  SizedBox(
                                      height: 53,
                                      width: 203,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            )),
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
                                            "Save".tr,
                                            style: GoogleFonts.getFont(
                                                MyLocal.getFontFamily(
                                                    Get.locale!.languageCode),
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
                title: Text(
                  "Email:".tr + " " + (controller.me?.email ?? ""),
                  style: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                    fontSize: Get.locale?.languageCode == 'ar' ? 18 : 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading: const Icon(Icons.email),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManager.primary,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
