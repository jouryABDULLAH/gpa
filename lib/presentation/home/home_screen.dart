import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/Map/map.dart';
import 'package:gpa/presentation/home/home_widget.dart';
import 'package:gpa/presentation/profile/profile_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int index = 0;
  final controller = Get.put(Controller());
  List screens = [
    const HomeWidget(),
    ServicisPage(),
    ProfileScreen(),
    screen_Map(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          setState(() {
            if (i >= 0 && i < screens.length) {
              index = i;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bxs_home),
            label: "home".tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bxs_grid_alt),
            label: "Services".tr,
          ),
          BottomNavigationBarItem(
              icon: Icon(Boxicons.bxs_bot),
              /*Image.asset(
                'lib/icons/chatbot-speech-bubble.png',
                width: 25,
                height: 25,
                color: Color.fromARGB(255, 255, 198, 34),
              ),*/
              label: "namik".tr),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.location), label: "map".tr),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.person), label: "account".tr),
        ],
        selectedLabelStyle: GoogleFonts.almarai(),
        unselectedLabelStyle: GoogleFonts.almarai(),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        unselectedItemColor: Color.fromARGB(255, 17, 53, 91),
      ),
    );
  }
}
