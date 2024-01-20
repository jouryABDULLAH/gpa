import 'package:flutter/material.dart';
import '../../shared/network/cache_helper.dart';


class AppTextFormField extends StatelessWidget {

  AppTextFormField(
      {Key? key,
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
      this.readonly})
      : super(key: key);
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

  String local = CacheHelper.getDate(key: 'local') ?? '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding??0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(head??""),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: readonly ?? false,
                  onChanged: onChanged,
                  validator: validate,
                  controller: controller,
                  textDirection: direction,
                  obscureText: secure??false,
                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    hintText: hint,
                    suffixIcon: suffix,
                    // prefixIcon:addMargin? local == "ar"? Padding(
                    //   padding: const EdgeInsets.only(left: 5),
                    //   child: Container(
                    //     margin: const EdgeInsets.only(right: 8),
                    //     decoration: const BoxDecoration(
                    //       border: Border(left: BorderSide(color: Colors.grey)),
                    //     ),
                    //     child:
                    //       prefix,
                    //   //  size: MediaQuery.of(context).size.width * 0.07,
                    //   ),
                    // ):
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 5),
                    //   child: Container(
                    //     margin: const EdgeInsets.only(left: 8),
                    //     decoration: const BoxDecoration(
                    //       border: Border(right: BorderSide(color: Colors.grey)),
                    //     ),
                    //     child:
                    //     prefix,
                    //     //  size: MediaQuery.of(context).size.width * 0.07,
                    //   ),
                    // ):null,
                    // label: Text(label!),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
