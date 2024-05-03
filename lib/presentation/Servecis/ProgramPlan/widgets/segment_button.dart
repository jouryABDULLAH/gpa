import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';

class SegmentButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isActive;

  const SegmentButton(
      {super.key,
      required this.title,
      required this.isActive,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: isActive
            ? BoxDecoration(
                color:
                    const Color.fromARGB(255, 118, 192, 184).withOpacity(0.7),
                borderRadius: BorderRadius.circular(12))
            : null,
        alignment: Alignment.center,
        child: Text(
          title.tr,
          style: GoogleFonts.getFont(
              MyLocal.getFontFamily(Get.locale!.languageCode),
              color: isActive
                  ? Colors.white
                  : const Color.fromARGB(255, 118, 192, 184).withOpacity(0.2),
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
