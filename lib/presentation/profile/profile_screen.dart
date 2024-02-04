import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/profile/widget/about_us.dart';
import 'package:gpa/presentation/profile/widget/change_password.dart';
import 'package:gpa/presentation/profile/widget/my_account.dart';

import '../../control.dart';
import '../resources/color_manager.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      title: Text(title),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: GetBuilder<Controller>(
        builder: (_) {
          if (controller.me!.name != null) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                buildDrawerListItem(
                    leading: Icons.person,
                    title: 'My account ',
                    onTap: () {
                      print(controller.me!.name);
                      Get.to(
                        MyAccount(userData: controller.me!),
                      )!
                          .then((value) => controller.getMe());
                    }),
                buildDrawerListItem(
                    leading: Icons.privacy_tip,
                    title: 'change password',
                    onTap: () {
                      Get.to(ChangePassword());
                    }),
                buildDrawerListItem(
                    leading: Icons.info_outline,
                    title: 'About us',
                    onTap: () {
                      Get.to(const AboutUs());
                    }),
                buildDrawerListItem(
                    leading: Icons.logout,
                    title: 'LogOut',
                    onTap: () {
                      controller.logout(context);
                    }),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
