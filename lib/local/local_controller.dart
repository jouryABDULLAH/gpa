import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLanguageController extends GetxController {
  SharedPreferences? sharedPreferences;
  late Locale initialLang;

  @override
  void onInit() {
    super.onInit();
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    initialLang = sharedPreferences!.getString("lang") == "ar"
        ? Locale("ar")
        : Locale("en");
  }

  void changLang(String codelang) {
    Locale locale = Locale(codelang);
    sharedPreferences!.setString("lang", codelang);

    Get.updateLocale(locale);
  }
}
