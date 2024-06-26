import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/cubit/send_alarm_cubit.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/local/local_controller.dart';
import 'package:gpa/shared/network/cache_helper.dart';
import 'package:gpa/splash_screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_notfications.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  AppNotifications appNotifications = AppNotifications();
  await appNotifications.setupNotification();
  tz.initializeTimeZones();

  MyLanguageController controller = Get.put(MyLanguageController());

  runApp(BlocProvider(
      create: (BuildContext context) => SendAlarmCubit(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = Get.locale?.languageCode ?? 'en';
    return ProviderScope(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: GoogleFonts.getFont(MyLocal.getFontFamily(languageCode))
              .fontFamily,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 81, 154),
          ),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        locale: Get.find<MyLanguageController>().initialLang,
        translations: MyLocal(),
      ),
    );
  }
}
