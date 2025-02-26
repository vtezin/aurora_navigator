import 'dart:convert';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';
import 'package:aurora_navigator/model/poi.dart';

class PoiService {
  static Future<String> _getResponse(LatLng coordinate, String type) async {
    final client = Client();

    final response = await client
        .get(Uri.parse("https://demo.maps.vk.com/api/places?api_key=test"
        "&q=prime"
        "&fields=name,pin"
        "&types=${type}"
        "&location=${coordinate.latitude},${coordinate.longitude}"
        "&limit=100"));

    //"&radius=500"
    //"&types=shop/general/general"
    //"&types=food/cafe"

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("getPoiResponse failure");
    }
  }

  static Future<List<Poi>> getPoiAround(LatLng coordinate, String type) async {
    final responseBody = await _getResponse(coordinate, type);
    final responseBodyJson = jsonDecode(responseBody);
    final listPoi = _listFromJson(responseBodyJson);
    return listPoi;
  }

  static List<Poi> _listFromJson(Map<String, dynamic> json) {
    final results = json['results'];

    List<Poi> listPoi = [];

    for (int i = 0; i < results.length - 1; i++) {
      final result = results[i];
      final name = result['name'];
      final coordinates = result['pin'];

      final poi = Poi(name, LatLng(coordinates.last, coordinates.first));

      listPoi.add(poi);
    }

    return listPoi;
  }
}