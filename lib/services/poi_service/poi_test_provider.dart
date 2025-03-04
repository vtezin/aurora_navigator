import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PoiTestProvider {
  static List<Marker> _getMarkers(List<LatLng> mapPoints, Image image) {
    return List.generate(
      mapPoints.length,
      (index) => Marker(
        point: mapPoints[index],
        child: image,
        width: 50,
        height: 50,
        alignment: Alignment.center,
      ),
    );
  }

  static List<LatLng> _getGasStations() => const [
        LatLng(55.550347, 37.543273),
        LatLng(55.561572, 37.556594),
        LatLng(55.577662, 37.569679),
        LatLng(55.614101, 37.490848),
        LatLng(55.618914, 37.484244),
      ];

  static List<Marker> getGasStationsMarkers() {
    return _getMarkers(
        _getGasStations(), Image.asset('assets/gas_station.png'));
  }

  static List<LatLng> _getCoffeeStations() => const [
    LatLng(55.548923,37.543051),
    LatLng(55.551456,37.553667),
    LatLng(55.600337,37.526504),
    LatLng(55.676334,37.499634),
  ];

  static List<Marker> getCoffeeMarkers() {
    return _getMarkers(
        _getCoffeeStations(), Image.asset('assets/cafe_icon.png'));
  }

  static List<Marker> getPoiMarkers(String poiType) {
    return _getMarkers(
        _getCoffeeStations(), Image.asset('assets/cafe_icon.png'));
  }
}
