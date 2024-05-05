import 'package:cr_calendar/cr_calendar.dart';
import 'package:gpa/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class PickerDayItemWidget extends StatelessWidget {
  const PickerDayItemWidget({
    required this.properties,
    super.key,
  });

  final DayItemProperties properties;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Stack(
        children: [
          if (properties.isInRange)
            Row(
              children: [
                Expanded(
                    child: Container(
                        color: properties.isFirstInRange
                            ? Colors.transparent
                            : ColorManager.violet.withOpacity(0.4))),
                Expanded(
                    child: Container(
                        color: properties.isLastInRange
                            ? Colors.transparent
                            : ColorManager.violet.withOpacity(0.4))),
              ],
            ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: properties.isFirstInRange ||
                      properties.isLastInRange ||
                      properties.isSelected
                  ? ColorManager.violet
                  : Colors.transparent,
            ),
            child: Center(
              child: Text('${properties.dayNumber}',
                  style: TextStyle(
                      color: properties.isInRange || properties.isSelected
                          ? Colors.white
                          : ColorManager.violet
                              .withOpacity(properties.isInMonth ? 1 : 0.5))),
            ),
          ),
        ],
      ),
    );
  }
}
