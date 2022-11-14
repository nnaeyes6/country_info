// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:country_list_app/data/models/country_model.dart';

import 'list_of_countries.dart';

class CountrySearch extends SearchDelegate {
  final List<CountryModel> countryList;

  CountrySearch(this.countryList);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var countries in countryList) {
      if (countries.nameCommon.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(countries.nameCommon);
      }
    }
    return const ListOfConuntries(countryList: []);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var countries in countryList) {
      if (countries.nameCommon.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(countries.nameCommon);
      }
    }
    return const ListOfConuntries(countryList: []);
  }
}
