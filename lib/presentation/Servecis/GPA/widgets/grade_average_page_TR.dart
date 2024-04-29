import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/local/local.dart';
import 'package:gpa/presentation/Servecis/GPA/GPA_Page.dart';
import 'package:gpa/presentation/Servecis/GPA/constants/app_constants.dart';
import 'package:gpa/presentation/Servecis/GPA/helper/data_helper.py.dart';
import 'package:gpa/presentation/Servecis/GPA/model/lesson.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/credit_dropdown_widget.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/lesson_list.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/letter_dropdown_widget.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/show_average.dart';
import 'package:boxicons/boxicons.dart';

class GradeAveragePageTR extends StatefulWidget {
  const GradeAveragePageTR({Key? key}) : super(key: key);

  @override
  _GradeAveragePageState createState() => _GradeAveragePageState();
}

class _GradeAveragePageState extends State<GradeAveragePageTR> {
  var formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  var enteringValue = "";
  int hours = 0;
  double previousGPA = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) =>  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Upper(),
          Expanded(
            flex: 1, // Reduce the flex factor to allocate less space
            child: _buildTopSection(),
          ),
          Flexible(
            flex: 3, // Adjust the flex value as neede
            child: LessonList(
              onDismiss: (index) {
                DataHelper.allAddedLessons.removeAt(index);
                setState(() {});
              },
            ),
          ),
          _buildBottomSection(),
        ],
      ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Flexible(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _buildForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() => Flexible(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Adjust spacing as needed
              Row(
                children: [
                  Expanded(child: _buildTextFormFieldPreviousHours()),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(child: _buildTextFormFieldPreviousGPA()),
                  Expanded(
                    flex: 1,
                    child: ShowAverage(
                      average: DataHelper.cumulativeAvg(hours, previousGPA),
                      numberOfClass: DataHelper.allAddedLessons.length,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: _buildTextFormField(),
              ),
              SizedBox(width: 0),
              Column(
                children: [
                  Text(
                    'g'.tr,
                    style: GoogleFonts.getFont(
                      MyLocal.getFontFamily(Get.locale!.languageCode),
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: Constants.iconPadding,
                    child: LetterDropdownWidget(
                      onLetterSelected: (letter) {
                        selectedLetterValue = letter;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(width: 1),
              Column(
                children: [
                  Text(
                    'h'.tr,
                    style: GoogleFonts.getFont(
                      MyLocal.getFontFamily(Get.locale!.languageCode),
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: Constants.iconPadding,
                    child: CreditDropdownWidget(
                      onCreditSelected: (credit) {
                        selectedCreditValue = credit;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: _LessonAndCalAvg,
                icon: Icon(Boxicons.bx_plus_circle),
                color: const Color.fromRGBO(255, 198, 34, 1),
                padding: EdgeInsets.only(top: 20),
                iconSize: 37,
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }

  _buildTextFormFieldPreviousHours() {
    return Padding(
      padding: const EdgeInsets.only(left: 6, top: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            hours = int.tryParse(value) ?? 0;
          });
        },
        validator: (v) {
          if (v!.isEmpty) {
            return "ph".tr;
          } else if (int.tryParse(v) == null) {
            return "vi".tr;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "ph".tr,
          hintStyle: GoogleFonts.getFont(
              MyLocal.getFontFamily(Get.locale!.languageCode),
              fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Constants.mainColor.withOpacity(0.3),
          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 8,
          ),
        ),
      ),
    );
  }

  _buildTextFormFieldPreviousGPA() {
    return Padding(
      padding: const EdgeInsets.only(left: 6, top: 10),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        onChanged: (value) {
          setState(() {
            previousGPA = double.tryParse(value) ?? 0.0;
          });
        },
        validator: (v) {
          if (v!.isEmpty) {
            return "Enter The Previous GPA".tr;
          } else if (double.tryParse(v) == null) {
            return "vi".tr;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "pg".tr,
          hintStyle: GoogleFonts.getFont(
              MyLocal.getFontFamily(Get.locale!.languageCode),
              fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Constants.mainColor.withOpacity(0.3),
          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 8,
          ),
        ),
      ),
    );
  }

  _buildTextFormField() {
    return SizedBox(
      width: 179,
      height: 91, // Adjust the width as needed
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 6, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Course Name".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 16),
            ),
            TextFormField(
              onSaved: (value) {
                setState(() {
                  enteringValue = value!;
                });
              },
              validator: (v) {
                if (v!.isEmpty) {
                  return "LN".tr;
                } else
                  return null;
              },
              decoration: InputDecoration(
                hintText: "LN".tr,
                helperStyle: GoogleFonts.getFont(
                    MyLocal.getFontFamily(Get.locale!.languageCode),
                    fontSize: 16),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Constants.mainColor.withOpacity(0.3),
              ),
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  fontSize: 17), // Adjust the font size as needed
            ),
          ],
        ),
      ),
    );
  }

  void _LessonAndCalAvg() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      var addingLesson = Lesson(
        name: enteringValue,
        letterGrade: selectedLetterValue,
        creditGrade: selectedCreditValue,
      );
      DataHelper.addLesson(addingLesson);

      // Debugging prints
      print("Hours: $hours");
      print("Previous GPA: $previousGPA");

      // Recalculate cumulative average
      var cumulativeAvg = DataHelper.cumulativeAvg(hours, previousGPA);
      print("Cumulative Average: $cumulativeAvg");

      setState(() {});
    }
  }


  Widget Upper() {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0),
      height: 150,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 167, 171),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(75, 0, 0, 0), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 10, // Blur radius
            offset: Offset(0, 4), // Offset of the shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GPAPage()),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25.0,
              ),
              padding: EdgeInsets.all(0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "GPA_22".tr,
              style: GoogleFonts.getFont(
                  MyLocal.getFontFamily(Get.locale!.languageCode),
                  textStyle: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 255, 255),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
