import 'dart:convert';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';
import 'package:aurora_navigator/misc/polyline_decoder.dart';

class RouteService {
  static Future<String> _getResponse(LatLng start, LatLng finish) async {
    final client = Client();

    final response = await client.post(Uri.parse("https://demo.maps.vk.com/api/directions"),
        body: '{"locations":[{"lat":${start.latitude},"lon":${start.longitude}},{"lat":${finish.latitude},"lon":${finish.longitude}}],"costing":"auto","language":"ru-RU","directions_type":"instructions","id":"test_route"}');

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("getRouteResponse failure");
    }
  }

  static List<LatLng> _routeFromJson(Map<String, dynamic> json) {
    final trips = json['trips'];

    List<LatLng> listPoints = [];

    for (int i = 0; i <= trips.length - 1; i++) {
      final result = trips[i];

      final legs = result['trip']['legs'];
      final shape = legs[0]['shape'];

      listPoints = PolylineDecoder.run(shape);
    }

    return listPoints;
  }

  static Future<List<LatLng>> getRoute(LatLng start, LatLng finish) async {
    final responseBody = await _getResponse(start, finish);
    final responseBodyJson = jsonDecode(responseBody);
    final listPoi = _routeFromJson(responseBodyJson);
    return listPoi;
  }
}