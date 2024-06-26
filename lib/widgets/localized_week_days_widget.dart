import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class LocalizedWeekDaysWidget extends StatelessWidget {
  const LocalizedWeekDaysWidget({
    required this.weekDay,
    super.key,
  });

  /// [String] value from [LocalizedWeekDaysBuilder].
  final String weekDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 0.3,
        ),
      ),
      height: 40,
      child: Center(
        child: Text(
          weekDay,
          style: TextStyle(
            color: ColorManager.violet.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
