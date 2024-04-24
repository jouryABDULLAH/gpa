import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
        toolbarHeight: 90,
        title: Text(
          "Academic advisor".tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ), // Align the text in the center
        ),
        centerTitle: true,
        backgroundColor: ColorManager.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Academic advisor".tr,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              widget.advisorName,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'WM'.tr,
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: ColorManager.white,
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
            style: GoogleFonts.almarai(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        )
          ],
        ),
      ),/*TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: ColorManager.white,
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
                        style: GoogleFonts.almarai(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    )*/
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
