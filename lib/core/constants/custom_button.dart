// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:country_list_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final String text;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: textfeildBTNColor,
          minimumSize: const Size(double.infinity, 50)),
      icon: icon,
      label: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: iconColorGrey, fontSize: 12, fontWeight: FontWeight.w700),
      ),
    );
  }
}
