import 'package:aurora_navigator/model/poi.dart';
import 'package:aurora_navigator/services/poi_service/poi_service.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class PoiNotifier extends ChangeNotifier {
  List<Poi> poiList = [];

  getPoiAround(LatLng coordinate, String type) async {
    poiList = await PoiService.getPoiAround(coordinate, type);
    notifyListeners();
  }
}