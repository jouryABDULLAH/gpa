import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/Map/map.dart';
import 'package:gpa/presentation/home/home_widget.dart';
import 'package:gpa/presentation/profile/profile_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/chatbot/chatbot_welcome_screen.dart';
import '../../../control.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/presentation/Servecis/ServecisPage.dart';
import 'package:ionicons/ionicons.dart';
import 'package:boxicons/boxicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final controller = Get.put(Controller());
  List screens = [
    const HomeWidget(),
    const ServicisPage(),
    const ChatbotWelcome(),
    const screen_Map(),
  ];

  @override
  void initState() {
    FirebaseMessaging.instance.subscribeToTopic("event");
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: FutureBuilder(
        future: controller.getMe(),
        builder: (_, da) {
          if (da.hasData) {
            return screens[index];
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        selectedItemColor: ColorManager.primary,
        onTap: (i) {
          if (mounted) {
            setState(() {
              if (i >= 0 && i < screens.length) {
                index = i;
              }
              if (i == 4) {
                _scaffoldKey.currentState!.openDrawer();
              }
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Boxicons.bxs_home),
            label: "home".tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Boxicons.bxs_grid_alt),
            label: "Services".tr,
          ),
          BottomNavigationBarItem(
              icon: const Icon(Boxicons.bxs_bot), label: "namik".tr),
          BottomNavigationBarItem(
              icon: const Icon(Ionicons.location), label: "map".tr),
          BottomNavigationBarItem(
              icon: const Icon(Ionicons.person), label: "account".tr),
        ],
        selectedLabelStyle: GoogleFonts.getFont(
          MyLocal.getFontFamily(Get.locale!.languageCode),
        ),
        unselectedLabelStyle: GoogleFonts.getFont(
          MyLocal.getFontFamily(Get.locale!.languageCode),
        ),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        unselectedItemColor: const Color.fromARGB(255, 17, 53, 91),
      ),
      drawer: const Drawer(
        child: ProfileScreen(),
      ),
    );
  }
}
