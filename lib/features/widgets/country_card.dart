// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_list_app/features/widgets/list_of_countries.dart';
import 'package:flutter/material.dart';

import 'package:country_list_app/features/screens/country_details.dart';

import '../../core/constants/colors.dart';
import '../../data/models/country_model.dart';

class CountryListCard extends StatelessWidget {
  const CountryListCard({
    Key? key,
    required this.groupTitle,
    required this.countryList,
  }) : super(key: key);

  final String groupTitle;
  final List<CountryModel> countryList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: ListOfConuntries(countryList: countryList));
  }
}
