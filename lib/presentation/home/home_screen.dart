import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa/presentation/Map/Map_screen.dart';
import 'package:gpa/presentation/home/home_widget.dart';
import 'package:gpa/presentation/profile/profile_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import '../../../control.dart';
// import 'package:gpa/shared/component/bottom_navbar.dart';

import 'package:gpa/presentation/Servecis/ServecisPage.dart';

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
    ServicisPage(),
    MapScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cleaning_services), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "namik"),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: "profile"),
        ],
      ),
    );
  }
}
