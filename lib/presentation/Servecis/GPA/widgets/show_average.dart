import 'package:flutter/material.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfClass > 0
              ? "$numberOfClass classes entered"
              : "Enter The Class",
// =======
//           numberOfClass > 0 ? "$numberOfClass classes entered" : " ",
// >>>>>>> HI
          style: Constants.numberOfClassesStyle,
        ),
        Text(
          average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: Constants.averageStyle,
        ),
        Text(
          "points",
          style: Constants.pointsStyle,
        )
      ],
    );
  }
}
