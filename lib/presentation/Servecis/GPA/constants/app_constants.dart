import 'package:flutter/material.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const mainColor = Color.fromARGB(255, 0, 168, 171);
  // static const String title = "حساب المعدل الفصلي";
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle numberOfClassesStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w800, color: mainColor);

  static final TextStyle pointsStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: mainColor);

  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16);

  static final EdgeInsets iconPadding = EdgeInsets.symmetric(horizontal: 8);
}
