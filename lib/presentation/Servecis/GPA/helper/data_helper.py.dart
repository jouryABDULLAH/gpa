import 'package:flutter/material.dart';
import 'package:gpa/presentation/Servecis/GPA/model/lesson.dart';

class DataHelper {
  static List<Lesson> allAddedLessons = [];

  static addLesson(Lesson lesson) {
    allAddedLessons.add(lesson);
  }

  static double calculateAvg() {
    double sumOfGrade = 0;
    double sumOfCredit = 0;

    allAddedLessons.forEach((element) {
      sumOfGrade = sumOfGrade + (element.creditGrade * element.letterGrade);
      sumOfCredit += element.creditGrade;
    });

    return sumOfGrade / sumOfCredit;
  }

// <<<<<<< HEAD
  static List<String> _gradeLetters() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
// =======
//

//   static List<String> _gradeLetters() {
//     return ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "E", "F"];
// >>>>>>> HI
  }

  static double cumulativeAvg(int previousHours, double previousGPA) {
    double sumOfGrade = 0;
    double sumOfCredit = 0;

    if (allAddedLessons.isNotEmpty) {
      allAddedLessons.forEach((element) {
        sumOfGrade += (element.creditGrade * element.letterGrade);
        sumOfCredit += element.creditGrade;
      });

      return (sumOfCredit + previousHours) != 0
          ? (sumOfGrade + (previousGPA * previousHours)) /
              (sumOfCredit + previousHours)
          : 0.0;
    } else {
      return 0.0; // Handle the case where there are no lessons added
    }
  }

  static double _convertLetterToValue(String letter) {
    switch (letter) {
// <<<<<<< HEAD
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
// =======
//       case "A+":
//         return 5.0;
//       case "A":
//         return 4.75;
//       case "B+":
//         return 4.5;
//       case "B":
//         return 4.0;
//       case "C+":
//         return 3.5;
//       case "C":
//         return 3.0;
//       case "D+":
//         return 2.5;
//       case "D":
//         return 2.5;
//       case "E":
//         return 2.0;
//       case "F":
//         return 1.0;
// >>>>>>> HI
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allGradeLetters() {
    return _gradeLetters()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _convertLetterToValue(e),
            ))
        .toList();
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> allClassesOfCredits() {
    return _allCredits()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
