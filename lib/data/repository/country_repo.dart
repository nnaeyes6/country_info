import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../core/constants/constant_api.dart';
import '../models/country_model.dart';

class CountryRepository {
  var data = [];
  // final String _baseUrl = "https://restcountries.com/v3.1/all";
  List<CountryModel> countryList = [];

  Future<List<CountryModel>> getCountries({String? query}) async {
    final response = await http.get(Uri.parse(ApiConstants.baseUrl));

    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body) as List;
      countryList = data.map((e) => CountryModel.fromJson(e)).toList();
      for (var element in jsonList) {
        countryList.add(
          CountryModel.fromJson(element),
        );
      }
      return countryList;
    } else {
      throw Exception('Failed to load countries.');
    }
  }
}
