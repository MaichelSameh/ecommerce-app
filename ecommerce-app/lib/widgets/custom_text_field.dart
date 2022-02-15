import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final String? hint;
  final Color? color;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  const CustomTextField({
    Key? key,
    this.height,
    this.width,
    this.borderRadius,
    this.hint,
    this.color,
    this.style,
    this.hintStyle,
    this.controller,
    this.suffixWidget,
    this.prefixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? MyPalette.secondary_color,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      //here we are using card to provide us with a material
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Row(
          children: [
            if (prefixWidget != null) prefixWidget!,
            Expanded(
              child: TextField(
                controller: controller,
                style: style ?? Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: hintStyle ??
                      Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .color!
                                .withOpacity(0.9),
                          ),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  errorBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  disabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedErrorBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            if (suffixWidget != null) suffixWidget!,
          ],
        ),
      ),
    );
  }
}
