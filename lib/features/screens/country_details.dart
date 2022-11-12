import 'package:country_list_app/core/constants/colors.dart';
import 'package:country_list_app/core/constants/ktext.dart';
import 'package:country_list_app/data/models/country_model.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatefulWidget {
  const CountryDetails({super.key, this.countryInfo});
  final CountryModel? countryInfo;

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorwt,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: iconColorGrey,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Ktext(
                      text: "Hello World",
                      color: iconColorGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
