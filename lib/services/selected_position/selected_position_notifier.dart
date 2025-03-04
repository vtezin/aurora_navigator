import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class SelectedPositionNotifier extends ChangeNotifier {
  LatLng? selectedPosition;

  setAndNotify(LatLng? position) {
    selectedPosition = position;
    notifyListeners();
  }
}