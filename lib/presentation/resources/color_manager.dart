import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color.fromARGB(255, 0, 168, 171);
  static Color splash = const Color(0xff021F4A);
  static Color perf = const Color(0xffF36711);
  static Color backGroundPerf = perf.withOpacity(0.1);
  static Color black = Colors.black;
  static Color yellow = Colors.yellow;
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color lightBlack = const Color(0x86000000);
  static Color blueGray = const Color(0xff3c5767);
  static Color blue = const Color(0xff7baef1);

  static Color textForm = const Color(0xffE1DFDF);
  static Color card = const Color(0xffEFEFEF);
  static Color scaffold = const Color(0xffEFEFEF);

  static Color story = const Color(0xff1C96A7).withOpacity(.6);
  static LinearGradient linearGradientMain = const LinearGradient(colors: [
    Color(0xff0D4296),
    Color(0xff3FABE3),
  ]);

  static LinearGradient linearGradientMsg = const LinearGradient(colors: [
    Color(0xff27B43D),
    Color(0xff06D81E),
  ]);

  // new colors
  static Color darkPrimary = const Color(0xff116d7a);
  static Color lightPrimary = const Color(0xff3FABE3); // color with 80% opacity
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);
  static Color white = const Color(0xffFFFFFF);
  static Color error = const Color(0xffe61f34); // red color
  static Color first = const Color(0xffF5F5F5); // red color
  static Color second = Colors.white;
  static const violet = Color.fromARGB(255, 17, 10, 48);

  /// Colors for [EventWidget].
  static const eventColors = [
    Color.fromARGB(255, 0, 168, 171),
    Color(0xff116d7a),
    Color(0xff0D4296),
    Color(0xffBEBEBE),
  ];
}
