// nav_bar.dart
import 'package:flutter/material.dart';
import 'package:gpa/presentation/home/home_widget.dart';
import 'package:gpa/presentation/profile/profile_screen.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

import '../../presentation/Servecis/ServecisPage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  List screens = [
    const HomeWidget(),
    const ServicisPage(),
    const ServicisPage(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
