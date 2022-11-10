import 'package:country_list_app/features/screens/my_country_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Country',
      theme: ThemeData(
        fontFamily: "Arvo",
        primarySwatch: Colors.blue,
      ),
      home: const MyCountryHomeScreen(),
    );
  }
}
