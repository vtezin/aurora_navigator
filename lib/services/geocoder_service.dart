import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';

class GeocoderService {
  static Future<String> _getResponse(String addressString) async {
    final client = Client();

    final response = await client
        .get(Uri.parse("https://demo.maps.vk.com/api/search?q=$addressString"
        "&q=$addressString"
    "&fields = pin"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("SuggestService getResponse failure");
    }
  }

  static List<LatLng> _listFromJson(Map<String, dynamic> json) {
    final results = json['results'];

    List<LatLng> list = [];

    for (int i = 0; i < results.length - 1; i++) {
      final result = results[i];
      final coordinates = result['pin'];

      final item = LatLng(coordinates.last, coordinates.first);

      list.add(item);
    }

    return list;
  }

  static Future<LatLng?> getCoordinateOfAddress(String addressString) async {
    final responseBody = await _getResponse(addressString);
    final responseBodyJson = jsonDecode(responseBody);
    final listResults = _listFromJson(responseBodyJson);

    return listResults.isEmpty ? null : listResults.first;
  }
}