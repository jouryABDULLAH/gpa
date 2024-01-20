import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorManager.primary,
                        child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            }),
                      ),
                      AppTextFormField(
                        padding: 10,
                        head: "Email",
                        controller: email,
                        validate: (c) {
                          if (!email.text.contains("@")) {
                            return "wrong email".tr;
                          }
                          return null;
                        },
                        hint: 'email',
                      ),
                      controller.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.perf,
                              ),
                            )
                          : Center(
                              child: AppButton(
                                content: 'Forget',
                                contentClr: Colors.white,
                                clr: ColorManager.primary,
                                onPressed: () async {},
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
