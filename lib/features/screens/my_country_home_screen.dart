import 'package:country_list_app/core/constants/colors.dart';
import 'package:country_list_app/core/constants/ktext.dart';
import 'package:flutter/material.dart';

class MyCountryHomeScreen extends StatelessWidget {
  const MyCountryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorwt,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColorwt,
        leading: Image.asset(
          'images/explore.jpeg',
        ),
        actions: [],
      ),
      body: const Center(
          child: Text(
        'Country',
        style: TextStyle(fontSize: 10),
      )),
    );
  }
}
