import 'package:aurora_navigator/model/suggest.dart';
import 'package:aurora_navigator/services/suggest_service/suggest_service.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class SuggestServiceNotifier extends ChangeNotifier {
  List<Suggest> resultsList = [];

  getSuggests(LatLng coordinate, String queryString) async {
    if (queryString.isEmpty) {
      resultsList.clear();
    } else {
      resultsList = await SuggestService.getSuggests(coordinate, queryString);
    }
    notifyListeners();
  }

  clearSuggests() {
    resultsList.clear();
    notifyListeners();
  }
}