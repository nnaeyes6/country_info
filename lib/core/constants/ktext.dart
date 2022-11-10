// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:country_list_app/core/constants/colors.dart';

class Ktext extends StatelessWidget {
  const Ktext({
    Key? key,
    required this.text,
    this.color,
    required this.fontStyle,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
  }) : super(key: key);
  final String text;
  final Color? color;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontStyle: fontStyle ?? FontStyle.normal,
          color: color ?? fontColor1,
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.w400),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
