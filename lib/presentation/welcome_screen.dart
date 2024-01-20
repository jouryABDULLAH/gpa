import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/logIn/login_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/resources/responsive.dart';
import 'package:gpa/presentation/sign_up/sign_up_screen.dart';
import 'package:gpa/shared/component/app_button.dart';
import '../../control.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
                  image: AssetImage("assets/images/login.png"),
                  fit: BoxFit.fill)),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: responsive.sHeight(context) / 2.7,
              decoration: const BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: nameKey,
                  child: Column(
                    children: [
                      AppButton(
                        content: 'Login',
                        contentClr: Colors.white,
                        clr: ColorManager.blueGray,
                        onPressed: () {
                          Get.to(const LogInWidget());
                        },
                      ),
                      const SizedBox(height: 10,),
                      const Text("Don 't Have Account?"),
                      const SizedBox(height: 10,),
                      TextButton(onPressed: (){
                        Get.to(const SignUpWidget());
                      }, child: const Text(
                        "Sign Up",style: TextStyle(color: Colors.red,decoration: TextDecoration.underline,),
                      ))
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
