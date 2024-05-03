// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/resources/color_manager.dart';

class aboutProgram extends StatefulWidget {
  const aboutProgram({super.key});

  @override
  State<aboutProgram> createState() => __aboutProgramState();
}

class __aboutProgramState extends State<aboutProgram> {
  final Map<String, dynamic> departmentInfo = {
    "البداية": "تأسس قسم علوم الحاسب في العام الدراسي 1419/1418هـ متزامناً...",
    "رئيس القسم": {
      "name": "د. محمد بن عبدالرحمن السحيباني",
      "office": "GR-210",
      "extension": "20394 - 12700",
      "email": "m.suhibani@qu.edu.sa"
    },
    "الرؤية":
        "يتطلع قسم علوم الحاسب لتحقيق الريادة في التعليم والبحث العلمي...",
    "نظام الدراسة بالقسم":
        "طبقاً للخطة الدراسية، الطالب يدرس ثمانية فصول دراسية...",
    "الهيكل العام للخطة الدراسية لقسم علوم الحاسب":
        "- السنة التحضيرية: 34 ساعة معتمدة..."
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
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
            toolbarHeight: 90,
            title: Text(
              "About program".tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                MyLocal.getFontFamily(Get.locale!.languageCode),
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: ColorManager.primary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Text(
              'البداية'.tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(departmentInfo["البداية".tr]),
            const SizedBox(height: 20),
            Text('رئيس القسم'.tr,
                style: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('الاسم:'.tr + "${departmentInfo["رئيس القسم"]["name"]}"),
            Text('المكتب: ${departmentInfo["رئيس القسم"]["office"]}'),
            Text('التحويلة: ${departmentInfo["رئيس القسم"]["extension"]}'),
            Text('البريد الإلكتروني: ${departmentInfo["رئيس القسم"]["email"]}'),
            const SizedBox(height: 20),
            Text(
              'الرؤية'.tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(departmentInfo["الرؤية".tr]),
            const SizedBox(height: 20),
            Text(
              'نظام الدراسة بالقسم'.tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(departmentInfo["نظام الدراسة بالقسم".tr]),
            const SizedBox(height: 20),
            Text(
              "haykal".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
                departmentInfo['الهيكل العام للخطة الدراسية لقسم علوم الحاسب']),
          ],
        ),
      ),
    );
  }
}
