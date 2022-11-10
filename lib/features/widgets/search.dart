import 'package:country_list_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({super.key});

  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: textfeildBTNColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [],
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search Country',
            iconColor: Colors.black,
            icon: Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    );
  }
}
