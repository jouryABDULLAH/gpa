import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/foreget_password.dart';
import 'package:gpa/presentation/sign_up/sign_up_screen.dart';
import '../create.dart';
import '../../shared/component/app_button.dart';
import '../../shared/component/text_form_field.dart';
import '../../../control.dart';
import '../resources/color_manager.dart';
import '../resources/responsive.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({super.key});

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

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
                  fit: BoxFit.fill)
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.all(20),
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
                        child: CircleAvatar(backgroundColor: ColorManager.primary,child: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){
                          Get.back();
                        }),),
                      ),
                      const SizedBox(height: 5,),
                      Text("Welcome Back!",
                        style: TextStyle(color: ColorManager.primary),),
                      const SizedBox(height: 5,),

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
                          content: 'Login',
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
                                isLogin: true,
                                ctx: context,
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
                      Center(
                        child: TextButton(onPressed: (){
                          Get.to(const ForgetPassword());
                        }, child: const Text(
                          "Forget  Password",style: TextStyle(color: Colors.red,decoration: TextDecoration.underline,),
                        )),
                      ),
                      Center(
                        child: TextButton(onPressed: (){
                          Get.to(const SignUpWidget());
                        }, child: const Text(
                          "Sign Up",style: TextStyle(color: Colors.red,decoration: TextDecoration.underline,),
                        )),
                      )
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