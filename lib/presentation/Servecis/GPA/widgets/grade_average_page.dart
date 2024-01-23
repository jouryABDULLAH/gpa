import 'package:flutter/material.dart';
import 'package:gpa/presentation/Servecis/GPA/GPA_Page.dart';
import 'package:gpa/presentation/Servecis/GPA/constants/app_constants.dart';
import 'package:gpa/presentation/Servecis/GPA/helper/data_helper.py.dart';
import 'package:gpa/presentation/Servecis/GPA/model/lesson.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/credit_dropdown_widget.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/lesson_list.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/letter_dropdown_widget.dart';
import 'package:gpa/presentation/Servecis/GPA/widgets/show_average.dart';

class GradeAveragePage extends StatefulWidget {
  const GradeAveragePage({Key? key}) : super(key: key);

  @override
  _GradeAveragePageState createState() => _GradeAveragePageState();
}

class _GradeAveragePageState extends State<GradeAveragePage> {
  var formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  var enteringValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      /* appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        elevation: 0,
        /* title: Text(
          Constants.title,
          style: Constants.titleStyle,
        ),*/
        centerTitle: true,
      ),*/
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Upper(),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(
                    average: DataHelper.calculateAvg(),
                    numberOfClass: DataHelper.allAddedLessons.length),
              ),
            ],
          ),
          Expanded(
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
          _buildTextFormField(),
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

  _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 30),
      child: TextFormField(
        onSaved: (value) {
          setState(() {
            enteringValue = value!;
          });
        },
        validator: (v) {
          if (v!.length <= 0) {
            return "Enter The Lesson Name.";
          } else
            return null;
        },
        decoration: InputDecoration(
          hintText: "Enter The Class",
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
        color: Color.fromARGB(255, 0, 168, 171),
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
              "حساب المعدل الفصلي",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
