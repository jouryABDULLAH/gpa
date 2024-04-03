import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa/presentation/Servecis/GPA/GPA_Page.dart';
import 'package:gpa/presentation/Servecis/GPA/constants/app_constants.dart';
import 'package:gpa/presentation/Servecis/GPA/helper/data_helper.py.dart';
import 'package:gpa/presentation/Servecis/GPA/model/lesson.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/credit_dropdown_widget.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/lesson_list.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/letter_dropdown_widget.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/show_average.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Upper(),
          Flexible(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: ShowAverage(
                    average: DataHelper.cumulativeAvg(hours, previousGPA),
                    numberOfClass: DataHelper.allAddedLessons.length,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              child: LessonList(
                onDismiss: (index) {
                  DataHelper.allAddedLessons.removeAt(index);
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          _buildTextFormField(),
          _buildTextFormFieldPreviousHours(),
          _buildTextFormFieldPreviousGPA(),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.iconPadding,
                  child: LetterDropdownWidget(
                    onLetterSelected: (letter) {
                      selectedLetterValue = letter;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.iconPadding,
                  child: CreditDropdownWidget(
                    onCreditSelected: (credit) {
                      selectedCreditValue = credit;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: _addLessonAndCalAvg,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: const Color.fromRGBO(0, 168, 171, 1),
                iconSize: 30,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  _buildTextFormFieldPreviousHours() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 10),
      child: TextFormField(
        keyboardType: TextInputType.number, // Set the keyboard type to number
        onSaved: (value) {
          setState(() {
            // Parse the entered value to an integer and save it to the 'hours' variable
            hours = int.tryParse(value!) ?? 0;
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
          border: OutlineInputBorder(
            borderRadius: Constants.borderRadius,
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Constants.mainColor.withOpacity(0.3),
        ),
      ),
    );
  }

  _buildTextFormFieldPreviousGPA() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 10),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(
            decimal: true), // Allow numeric input with decimal
        onSaved: (value) {
          setState(() {
            // Parse the entered value to a double and save it to the 'previousGPA' variable
            previousGPA = double.tryParse(value!) ?? 0.0;
          });
        },
        validator: (v) {
          if (v!.isEmpty) {
            return "Enter The Previous GPA.";
          } else if (double.tryParse(v) == null) {
            return "vi".tr;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "pg".tr,
          border: OutlineInputBorder(
            borderRadius: Constants.borderRadius,
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Constants.mainColor.withOpacity(0.3),
        ),
      ),
    );
  }

  _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 10),
      child: TextFormField(
        onSaved: (value) {
          setState(() {
            enteringValue = value!;
          });
        },
        validator: (v) {
          if (v!.length <= 0) {
            return "LN".tr;
          } else
            return null;
        },
        decoration: InputDecoration(
          hintText: "LN".tr,
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.mainColor.withOpacity(0.3),
        ),
      ),
    );
  }

  void _addLessonAndCalAvg() {
    formKey.currentState!.save();
    if (formKey.currentState!.validate()) {
      var addingLesson = Lesson(
          name: enteringValue,
          letterGrade: selectedLetterValue,
          creditGrade: selectedCreditValue);
      DataHelper.addLesson(addingLesson);
      print(DataHelper.calculateAvg());
      setState(() {});
    }
  }

  Widget Upper() {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0),
      height: 200,
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
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
