import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:gpa/presentation/Servecis/ProgramPlan/plan.dart';

class RemainingHrsRow extends StatelessWidget {
  final RemainingHrs sObj;
  final List<RemainingHrs> stdRemHrs;
  final VoidCallback onPressed;

  const RemainingHrsRow(
      {super.key,
      required this.sObj,
      required this.onPressed,
      required this.stdRemHrs});

  @override
  Widget build(BuildContext context) {
    RemainingHrs? matchedStdHrs = stdRemHrs.firstWhere(
      (stdRemHrs) => stdRemHrs.type == sObj.type,
      orElse: () => RemainingHrs("Total hour".tr, 0, 0,
          const Color.fromARGB(255, 21, 163, 195), 0 - 0),
    );

    double remainingPercentage = (sObj.takenHrs / sObj.total) * 100;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Container(
          height: 150,
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 25),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 21, 219, 166).withOpacity(0.15),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Remaining ${sObj.type}:",
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                sObj.remaining != 0
                    ? "${sObj.remaining} hours needed to complete ${sObj.total} hours"
                    : "You have completed all of the required ${sObj.type}",
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: remainingPercentage / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                    matchedStdHrs.color.withOpacity(0.5)),
              ),
              const SizedBox(height: 8),
              Text(
                remainingPercentage != 100.0
                    ? "${remainingPercentage.toStringAsFixed(1)}% Remaining"
                    : "${remainingPercentage.toStringAsFixed(1)}% Completed",
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
