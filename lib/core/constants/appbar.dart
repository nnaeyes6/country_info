import 'package:country_list_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: backgroundColorwt,
    title: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: RichText(
            text: const TextSpan(children: [
          TextSpan(
            text: 'Explore',
            style: TextStyle(
                fontFamily: 'ElsieSwashCaps',
                color: exploreIconWtTheme,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 18),
          ),
          TextSpan(
            text: ".",
            style: TextStyle(
                fontFamily: 'ElsieSwashCaps',
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )
        ]))),
    //   child: const Text(

    // ),
    actions: [
      Container(
        height: 10,
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          'images/sun.png',
        ),
      ),
    ],
  );
}
