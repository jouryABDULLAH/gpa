import 'package:cr_calendar/cr_calendar.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeekDaysWidget extends StatelessWidget {
  const WeekDaysWidget({
    required this.day,
    super.key,
  });

  /// [WeekDay] value from [WeekDaysBuilder].
  final WeekDay day;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text(
          describeEnum(day).substring(0, 1).toUpperCase(),
          style: TextStyle(
            color: ColorManager.violet.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
