import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/ktext.dart';
import '../../data/models/country_model.dart';

class CustomButtons extends StatefulWidget {
  const CustomButtons({
    Key? key,
    required this.filterList,
  }) : super(key: key);

  final List<CountryModel> filterList;

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  // String dropDownValue = 'Filter';

  // // List of items in our dropdown menu
  // var continentFilter = [
  // 'Africa',
  // 'Antarctica',
  // 'Asia',
  // 'Australia',
  // 'Europe',
  // 'North America',
  // 'South America',
  // ];

  String dropdownvalue = 'Filter';

  // List of items in our dropdown menu
  var items = [
    'Filter',
    'Africa',
    'Antarctica',
    'Asia',
    'Australia',
    'Europe',
    'South America',
    'North America',
  ];

  bool selectedFilter = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_1_rounded,
                color: iconColorGrey,
              ),
              label: const Ktext(
                text: 'Filter',
                color: iconColorGrey,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Row(
                        children: [
                          Text(items),
                          Checkbox(
                              value: selectedFilter,
                              onChanged: ((value) {
                                setState(() {
                                  selectedFilter != selectedFilter;
                                });
                              }))
                        ],
                      ),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
