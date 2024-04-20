import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/Servecis/GPA/constants/app_constants.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int numberOfClass;

  const ShowAverage(
      {Key? key, required this.average, required this.numberOfClass})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfClass > 0 ? "$numberOfClass classes entered" : " ",
          style: Constants.numberOfClassesStyle,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: Constants.averageStyle,
        ),
        Text(
          "points".tr,
          style: GoogleFonts.getFont(
              MyLocal.getFontFamily(Get.locale!.languageCode),
              textStyle: Constants.pointsStyle,
              fontSize: 12,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
