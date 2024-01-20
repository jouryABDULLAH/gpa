import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gpa/presentation/welcome_screen.dart';
import 'package:gpa/shared/network/cache_helper.dart';

import '../presentation/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      await getUid().then((value) {
        if (value != null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Welcome()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const FlutterLogo();
  }

  Future getS() async {
    return await CacheHelper.getDate(key: 'first');
  }

  Future getUid() async {
    return await CacheHelper.getDate(key: 'uId');
  }
}
