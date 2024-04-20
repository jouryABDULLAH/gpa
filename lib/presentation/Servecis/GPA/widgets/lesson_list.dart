import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
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
                  padding: const EdgeInsets.all(3.0),
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
                          "الساعات: ${DataHelper.allAddedLessons[index].creditGrade}, Letter Grade: ${DataHelper.allAddedLessons[index].letterGrade}"),
                    ),
                  ),
                ),
              );
            })
        : Container(
            alignment: Alignment.center,
            child: Text(
              "pa".tr,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  textStyle: Constants.titleStyle),
            ),
          );
  }
}
