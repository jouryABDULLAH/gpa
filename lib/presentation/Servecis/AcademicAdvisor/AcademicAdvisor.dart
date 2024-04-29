import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../local/local.dart';
import '../../resources/color_manager.dart';


class AdvisorInfoPage extends StatefulWidget {
  final String advisorName;
  final String advisorEmail;

  AdvisorInfoPage({required this.advisorName, required this.advisorEmail});

  @override
  _AdvisorInfoPageState createState() => _AdvisorInfoPageState();
}

class _AdvisorInfoPageState extends State<AdvisorInfoPage> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 99.0,
        title: Text(
          "Academic advisor".tr,
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(
            MyLocal.getFontFamily(Get.locale!.languageCode),
            textStyle: TextStyle(
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              Text(
                "Academic advisor".tr,
                style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 3, 3, 3),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.advisorName,
                style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  textStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 3, 3, 3),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'WM'.tr,
                  hintStyle: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                    textStyle: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(97, 107, 99, 99),
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor:  ColorManager.white,
                  backgroundColor: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  _sendEmail(widget.advisorEmail, _messageController.text);
                },
                child: Text(
                  'SM'.tr,
                  style: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                    textStyle: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendEmail(String email, String message) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': 'Message from Student', 'body': message},
    );
    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
      _messageController.clear(); // Clear the text field after sending email
    } else {
      throw 'Could not launch $email';
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
