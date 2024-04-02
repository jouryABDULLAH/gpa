import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "who".tr,
          style: GoogleFonts.tajawal(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 167, 171)),
        ),
      ),
      body: //const
          SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("ab".tr,
                  style: GoogleFonts.tajawal(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
    );
  }
}
