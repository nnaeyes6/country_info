import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../data/models/country_model.dart';
import '../screens/country_details.dart';

class ListOfConuntries extends StatelessWidget {
  const ListOfConuntries({
    Key? key,
    required this.countryList,
  }) : super(key: key);

  final List<CountryModel> countryList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: countryList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: (() {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CountryDetails(
                      countryInfo: countryList[index],
                    )));
          }),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 2,
              color: textfeildBTNColor,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: Wrap(alignment: WrapAlignment.start, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: countryList[index].flagPng,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        countryList[index].nameCommon,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        countryList[index].capital,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
