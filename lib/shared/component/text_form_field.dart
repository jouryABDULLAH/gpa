import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/network/cache_helper.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    Key? key,
    this.head,
    this.padding,
    this.hint,
    this.phone = false,
    this.secure,
    this.addMargin = false,
    this.label,
    this.prefix,
    this.suffix,
    this.controller,
    this.validate,
    this.onChanged,
    this.initVal,
    this.direction,
    this.textInputType,
    this.readonly,
    this.textStyle,
    this.fontSize,
    this.obscureText = false,
  }) : super(key: key);

  final String? hint;
  final String? head;
  final double? padding;
  final String? label;
  final bool? secure;
  bool phone = false;
  bool addMargin = false;
  final Widget? prefix;
  final String? initVal;
  final TextDirection? direction;
  final Widget? suffix;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? textInputType;
  final bool? readonly;
  final TextStyle? textStyle;
  final double? fontSize;
  final bool obscureText;

  String local = CacheHelper.getDate(key: 'local') ?? '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            head ?? "",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 0, 81, 154),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: readonly ?? false,
                  onChanged: onChanged,
                  validator: validate,
                  controller: controller,
                  textDirection: direction,
                  obscureText: secure ?? false,
                  style: textStyle ??
                      Theme.of(context)
                          .inputDecorationTheme
                          .hintStyle, // Use custom or default text style
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    hintText: hint,
                    suffixIcon: suffix,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color.fromARGB(255, 0, 81, 154),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color.fromARGB(255, 0, 81, 154),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color.fromARGB(255, 0, 81, 154),
                        ), //
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
