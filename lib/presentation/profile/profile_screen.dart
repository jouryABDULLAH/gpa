import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local_controller.dart';
import 'package:gpa/presentation/profile/widget/about_us.dart';
import 'package:gpa/presentation/profile/widget/change_password.dart';
import 'package:gpa/presentation/profile/widget/my_account.dart';
import 'package:boxicons/boxicons.dart';
import '../../control.dart';
import '../resources/color_manager.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final style = TextStyle(fontSize: 30, fontWeight: FontWeight.normal);
  final controller = Get.put(Controller());

  Widget buildDrawerListItem(
      {required IconData leading,
      required String title,
      Widget? trailing,
      Function()? onTap,
      Color? color}) {
    return ListTile(
      leading: Icon(
        leading,
        color: ColorManager.primary,
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      onTap: onTap,
      trailing: trailing ??= Icon(
        Icons.arrow_forward_ios,
        color: ColorManager.primary,
      ),
    );
  }

  Widget buildDrawerListItemDivider() {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 18,
      endIndent: 24,
    );
  }

  @override
  void initState() {
    controller.getMe();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyLanguageController languageController = Get.find();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: EdgeInsets.only(right: 30, top: 5),
            child: Text(
              "account".tr,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 167, 171)),
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder<Controller>(
        builder: (_) {
          if (controller.me!.name != null) {
            return ListView(
              padding: EdgeInsets.only(top: 30),
              children: [
                buildDrawerListItem(
                  leading: Boxicons.bx_user_circle,
                  title: "info".tr,
                  onTap: () {
                    print(controller.me!.name);
                    Get.to(
                      MyAccount(userData: controller.me!),
                    )!
                        .then((value) => controller.getMe());
                  },
                ),
                buildDrawerListItem(
                  leading: Boxicons.bx_refresh,
                  title: "pass".tr,
                  onTap: () {
                    Get.to(ChangePassword());
                  },
                ),
                buildDrawerListItem(
                  leading: Boxicons.bx_info_circle,
                  title: "who".tr,
                  onTap: () {
                    Get.to(const AboutUs());
                  },
                ),
                Row(
                  children: [
                    SizedBox(width: 15),
                    Icon(
                      Icons.language,
                      color: ColorManager.primary,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Lang".tr,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(width: 130),
                    ToggleButtons(
                      isSelected: isSelected,
                      selectedColor: Colors.white,
                      color: Colors.cyan,
                      renderBorder: false,
                      fillColor: Colors.cyan,
                      borderRadius: BorderRadius.circular(20),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text("Arabic"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text("English"),
                        )
                      ],
                      onPressed: (int newIndex) {
                        setState(() {
                          isSelected = isSelected.map((e) => false).toList();
                          isSelected[newIndex] = true;
                          if (newIndex == 0) {
                            languageController.changLang("ar");
                          } else {
                            languageController.changLang("en");
                          }
                        });
                      },
                    ),
                  ],
                ),
                buildDrawerListItem(
                  leading: Icons.logout,
                  title: "out".tr,
                  onTap: () {
                    controller.logout(context);
                  },
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  List<bool> isSelected = [true, false];
}
