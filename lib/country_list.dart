// country_list.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<String>> fetchCountries() async {
  
   final response =
      await http.get(Uri.parse('https://restcountries.com/v3.1/all?fields=name'));

  if (response.statusCode == 200) {
    List<dynamic> countriesJson = json.decode(response.body);
    List<String> countryList = countriesJson
        .map((country) => country['name']['common'] as String)
        .toList();
    return countryList;
  } else {
    throw Exception('Failed to load countries');
  }
  /*
  List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'India',
    'Germany',
    'France',
    'Japan',
    'China',
    'Brazil',
    'South Africa'
  ];

  return countries;
  */
}