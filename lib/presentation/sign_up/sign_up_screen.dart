import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  image: AssetImage("assets/images/Sign_up_page.png"),
                  fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: responsive.sHeight(context) / 1.55,
              width: responsive.sWidth(context) - 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
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
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Get.back();
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Nice".tr,
                        style: TextStyle(color: ColorManager.primary),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "Name".tr,
                        controller: name,
                        hint: "Name".tr,
                        validate: (c) {
                          if (name.text.trim().isEmpty) {
                            return "cannot empty".tr;
                          }
                          if (c!.contains(RegExp("[a-z,A-Z]"))) {
                            return "يجب ان يكون الاسم باللغة العربية".tr;
                          }

                          return null;
                        },
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "Email",
                        controller: email,
                        validate: (c) {
// <<<<<<< HEAD
//                           if (!email.text.contains("@qu.edu.sa")) {
//                             return "must contains @qu.edu.sa".tr;
//                           }
//                           return null;
//                         },
//                         hint: '0000000000@qu.edu.sa',
// =======
                          if (!email.text.contains("@")) {
                            return "wrong email".tr;
                          }
                          return null;
                        },
                        hint: 'email',
// >>>>>>> HI
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "id".tr,
                        controller: id,
                        hint: "id".tr,
                        validate: (c) {
                          if (id.text.trim().isEmpty) {
                            return "cannot empty".tr;
                          }
                          if (c!.isEmpty) {
                            return "لا يجب ان يكون الحقل فارغ".tr;
                          }

                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "Password",
                        controller: password,
                        validate: (c) {
                          if (password.text.length < 8) return "less 8".tr;
                          return null;
                        },
                        hint: 'password',
                      ),
                      controller.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.perf,
                              ),
                            )
                          : Center(
                              child: AppButton(
                                content: 'Sign Up',
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
