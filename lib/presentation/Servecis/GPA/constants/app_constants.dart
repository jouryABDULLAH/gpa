import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Color.fromARGB(255, 0, 168, 171);

  static String title = "GPA".tr;

  static final TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.w700, color: mainColor);

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle numberOfClassesStyle = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);

  static final TextStyle averageStyle = GoogleFonts.poppins(
      fontSize: 46, fontWeight: FontWeight.w700, color: mainColor);

  static final TextStyle pointsStyle = GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w600, color: mainColor);

  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 12);

  static final EdgeInsets iconPadding = EdgeInsets.symmetric(horizontal: 6);
}
