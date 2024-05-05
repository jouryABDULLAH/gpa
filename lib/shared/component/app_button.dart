import 'package:flutter/material.dart';
import '../../presentation/resources/color_manager.dart';
import '../../presentation/resources/responsive.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final dynamic content;
  final Color? clr;
  final Color? contentClr;
  final double? width;
  final bool flexibleWidth;
  final double? height;
  final bool flexibleHeight;
  final BorderRadius? borderRadius;
  final bool loading;
  final double? elevation;
  final EdgeInsets? padding;
  final bool gradient;
  final BorderSide? border;

  const AppButton(
      {super.key,
      required this.content,
      required this.onPressed,
      this.clr,
      this.contentClr,
      this.width,
      this.flexibleWidth = false,
      this.height,
      this.flexibleHeight = false,
      this.borderRadius,
      this.loading = false,
      this.elevation,
      this.padding,
      this.gradient = false,
      this.border});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: clr ?? Colors.black,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          gradient: gradient ? ColorManager.linearGradientMain : null),
      child: MaterialButton(
        onPressed: loading ? () {} : onPressed,
        child: loading
            ? const CircularProgressIndicator.adaptive()
            : content.runtimeType == String
                ? Text(
                    content,
                    style: TextStyle(color: contentClr ?? Colors.white),
                  )
                : content,
        padding: padding,
        minWidth:
            flexibleWidth ? null : width ?? responsive.sWidth(context) * .35,
        height: flexibleHeight
            ? null
            : height ?? responsive.responsiveHigh(context, .06),
        elevation: gradient ? 0 : elevation,
        highlightElevation: gradient ? 0 : null,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5),
            side: border ??
                const BorderSide(
                    color: Color.fromARGB(255, 211, 67, 67), width: 0)),
      ),
    );
  }
}
