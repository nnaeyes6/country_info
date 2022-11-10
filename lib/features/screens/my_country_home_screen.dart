import 'package:country_list_app/core/constants/appbar.dart';
import 'package:country_list_app/core/constants/colors.dart';
import 'package:country_list_app/core/constants/custom_button.dart';
import 'package:country_list_app/core/constants/ktext.dart';
import 'package:country_list_app/features/widgets/country_card.dart';
import 'package:country_list_app/features/widgets/search.dart';
import 'package:flutter/material.dart';

class MyCountryHomeScreen extends StatelessWidget {
  const MyCountryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorwt,
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchCountry(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: CustomButton(
                        text: 'EN',
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: iconColorGrey,
                        )),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: CustomButton(
                        text: 'Filter',
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: iconColorGrey,
                        )),
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Ktext(text: 'A'),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CountryList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
