import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';

class Poi extends Equatable {
  final String title;
  final LatLng coordinate;

  const Poi(this.title, this.coordinate);

  @override
  List<Object> get props => [title, coordinate];

  static List<Poi> _listFromJson(Map<String, dynamic> json) {
    final results = json['results'];

    List<Poi> listPoi = [];

    for (int i = 0; i < results.length - 1; i++) {
      final result = results[i];
      final name = result['name'];
      final coordinates = result['pin'];

      final poi = Poi(name, LatLng(coordinates.first, coordinates.last));

      listPoi.add(poi);
    }

    return listPoi;
  }

  static Future<String> _getPoiResponse(LatLng coordinate) async {
    final client = Client();

    final response = await client
        .get(Uri.parse("https://demo.maps.vk.com/api/places?api_key=test"
            "&q=prime"
            "&fields=name,pin"
            "&location=${coordinate.latitude},${coordinate.longitude}"
            "&limit=10"));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("getPoiResponse failure");
    }
  }

  static Future<List<Poi>> getPoiAround(LatLng coordinate) async {
    final responseBody = await _getPoiResponse(coordinate);
    final responseBodyJson = jsonDecode(responseBody);
    final listPoi = _listFromJson(responseBodyJson);
    return listPoi;
  }
}
