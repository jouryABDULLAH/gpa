import 'package:flutter/material.dart';
import 'package:gpa/presentation/Servecis/GPA/constants/app_constants.dart';
import 'package:gpa/presentation/Servecis/GPA/helper/data_helper.py.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataHelper.allAddedLessons.length > 0
        ? ListView.builder(
            itemCount: DataHelper.allAddedLessons.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(DataHelper.allAddedLessons[index].name),
                      leading: CircleAvatar(
                          backgroundColor: Constants.mainColor,
                          child: Text((DataHelper
                                      .allAddedLessons[index].letterGrade *
                                  DataHelper.allAddedLessons[index].creditGrade)
                              .toStringAsFixed(0))),
                      subtitle: Text(
                          "Credit: ${DataHelper.allAddedLessons[index].creditGrade}, Letter Grade: ${DataHelper.allAddedLessons[index].letterGrade}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Text("Please Add Lesson.",
                textAlign: TextAlign.center, style: Constants.titleStyle),
            alignment: Alignment.center,
          );
  }
}
