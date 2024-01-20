import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:gpa/presentation/resources/constants.dart';
import 'package:gpa/presentation/resources/extensions.dart';
import 'package:flutter/material.dart';

class DatePickerTitle extends StatelessWidget {
  const DatePickerTitle({
    required this.date,
    super.key,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 16),
        alignment: Alignment.centerLeft,
        child: Text(
          date.format(kMonthFormatWidthYear),
          style: const TextStyle(
            fontSize: 21,
            color: ColorManager.violet,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
