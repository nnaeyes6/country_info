import 'package:country_list_app/core/constants/ktext.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class CountryList extends StatelessWidget {
  const CountryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {},
            child: Card(
              elevation: 2,
              color: textfeildBTNColor,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/russia.png',
                      height: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(
                          height: 5,
                        ),
                        Ktext(text: 'Country'),
                        Ktext(text: 'Capital'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
