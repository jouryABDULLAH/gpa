import 'package:flutter/material.dart';
import 'package:gpa/presentation/Servecis/GPA/constants/app_constants.dart';
import 'package:gpa/presentation/Servecis/GPA/helper/data_helper.py.dart';

class LetterDropdownWidget extends StatefulWidget {
  final Function onLetterSelected;
  const LetterDropdownWidget({required this.onLetterSelected, Key? key})
      : super(key: key);

  @override
  _LetterDropdownWidgetState createState() => _LetterDropdownWidgetState();
}

class _LetterDropdownWidgetState extends State<LetterDropdownWidget> {
  double selectedLetterValue = 4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Container(
        alignment: Alignment.topRight,
        padding: Constants.dropDownPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Constants.mainColor.withOpacity(0.3),
        ),
        child: DropdownButton<double>(
          value: selectedLetterValue,
          elevation: 16,
          iconEnabledColor: Constants.mainColor,
          onChanged: (selectedValue) {
            setState(() {
              selectedLetterValue = selectedValue!;
              widget.onLetterSelected(selectedLetterValue);
            });
          },
          underline: Container(),
          items: DataHelper.allGradeLetters(),
        ),
      ),
    );
  }
}
