import 'package:aurora_navigator/services/route_service/route_service.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class RouteNotifier extends ChangeNotifier {
  List<LatLng> route = [];

  getRoute(LatLng start, LatLng finish) async {
    route = await RouteService.getRoute(start, finish);
    notifyListeners();
  }
}