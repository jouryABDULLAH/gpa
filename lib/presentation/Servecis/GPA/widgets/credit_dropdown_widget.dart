import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa/presentation/Servecis/GPA/constants/app_constants.dart';
import 'package:gpa/presentation/Servecis/GPA/helper/data_helper.py.dart';

class CreditDropdownWidget extends StatefulWidget {
  final Function onCreditSelected;
  const CreditDropdownWidget({required this.onCreditSelected, Key? key})
      : super(key: key);

  @override
  _CreditDropdownWidgetState createState() => _CreditDropdownWidgetState();
}

class _CreditDropdownWidgetState extends State<CreditDropdownWidget> {
  double selectedCreditValue = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 55,
        alignment: Alignment.center,
        padding: Constants.dropDownPadding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Constants.mainColor.withOpacity(0.3)),
        child: DropdownButton<double>(
          value: selectedCreditValue,
          elevation: 16,
          iconEnabledColor: Constants.mainColor,
          onChanged: (selectedValue) {
            setState(() {
              selectedCreditValue = selectedValue!;
              widget.onCreditSelected(selectedCreditValue);
            });
          },
          underline: Container(),
          items: DataHelper.allClassesOfCredits(),
        ),
      ),
    );
  }
}
