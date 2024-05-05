import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/local/local_controller.dart';
import 'package:gpa/presentation/profile/widget/about_us.dart';
import 'package:gpa/presentation/profile/widget/change_password.dart';
import 'package:gpa/presentation/profile/widget/my_account.dart';
import 'package:boxicons/boxicons.dart';
import '../../control.dart';
import '../resources/color_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final style = const TextStyle(fontSize: 30, fontWeight: FontWeight.normal);
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
        textAlign: TextAlign.left,
        style: GoogleFonts.getFont(
          MyLocal.getFontFamily(Get.locale!.languageCode),
          textStyle: const TextStyle(
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.primary,
            boxShadow: const [
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
            actions: const [],
            centerTitle: true,
            title: Text(
              "profiletitle".tr,
              style: GoogleFonts.getFont(
                MyLocal.getFontFamily(Get.locale!.languageCode),
                textStyle: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<Controller>(
        builder: (_) {
          if (controller.me!.name != null) {
            return ListView(
              padding: const EdgeInsets.only(top: 30),
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
                    Get.to(() => const AboutUs());
                  },
                ),
                Row(
                  children: [
                    const SizedBox(width: 15),
                    Icon(
                      Icons.language,
                      color: ColorManager.primary,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Lang".tr,
                      style: GoogleFonts.getFont(
                        MyLocal.getFontFamily(Get.locale!.languageCode),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(width: 27),
                    ToggleButtons(
                      borderColor: ColorManager.primary,
                      borderWidth: 1.0,
                      isSelected: isSelected,
                      selectedColor: Colors.white,
                      color: ColorManager.primary,
                      renderBorder: false,
                      fillColor: ColorManager.primary,
                      borderRadius: BorderRadius.circular(15),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Arabic".tr,
                            style: GoogleFonts.getFont(
                              fontSize:
                                  Get.locale?.languageCode == 'ar' ? 16 : 14,
                              MyLocal.getFontFamily(Get.locale!.languageCode),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "English".tr,
                            style: GoogleFonts.getFont(
                              fontSize:
                                  Get.locale?.languageCode == 'ar' ? 16 : 14,
                              MyLocal.getFontFamily(Get.locale!.languageCode),
                            ),
                          ),
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
