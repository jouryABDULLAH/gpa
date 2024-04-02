import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLanguageController extends GetxController {
  SharedPreferences? sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    initializeSharedPreferences();
  }

  Future<void> initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void changLang(String codelang) {
    Locale locale = Locale(codelang);
    sharedPreferences!.setString("lang", codelang);

    Get.updateLocale(locale);
  }
}
