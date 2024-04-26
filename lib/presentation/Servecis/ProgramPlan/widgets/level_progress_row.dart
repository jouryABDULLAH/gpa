import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:gpa/presentation/Servecis/ProgramPlan/plan.dart';

class LevelCompletionRow extends StatelessWidget {
  final String level;
  final int totalHours;
  final int completedHours;
  final VoidCallback onPressed;

  const LevelCompletionRow({
    super.key,
    required this.level,
    required this.totalHours,
    required this.completedHours,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double completionPercentage = (completedHours / totalHours) * 100;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Container(
          height: 125,
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 25),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 21, 219, 166).withOpacity(0.15),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Level: $level",
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text( completedHours == totalHours ? "level is completed" :
                "$completedHours hours completed out of $totalHours",
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: completionPercentage / 100,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                backgroundColor: Colors.grey[300],
                valueColor:  AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 0, 145, 94).withOpacity(0.5)),
              ),
              const SizedBox(height: 8),
              Text(
                "${completionPercentage.toStringAsFixed(1)}%",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
