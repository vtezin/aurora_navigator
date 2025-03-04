import 'package:aurora_navigator/model/suggest.dart';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';

class SuggestService {
  static Future<String> _getResponse(LatLng coordinate, String queryString) async {
    final client = Client();

    final response = await client
        .get(Uri.parse("https://demo.maps.vk.com/api/suggest?limit=5"
        "&q=$queryString"
        "&location=${coordinate.latitude},${coordinate.longitude}"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("SuggestService getResponse failure");
    }
  }

  static List<Suggest> _listFromJson(Map<String, dynamic> json) {
    final results = json['results'];

    List<Suggest> list = [];

    for (int i = 0; i < results.length - 1; i++) {
      final result = results[i];
      final name = result['name'];
      final address = result['address'];

      final item = Suggest(name, address);

      list.add(item);
    }

    return list;
  }

  static Future<List<Suggest>> getSuggests(LatLng coordinate, String queryString) async {
    final responseBody = await _getResponse(coordinate, queryString);
    final responseBodyJson = jsonDecode(responseBody);
    final listResults = _listFromJson(responseBodyJson);
    return listResults;
  }
}