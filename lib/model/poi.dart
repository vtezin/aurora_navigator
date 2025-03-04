import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class Poi extends Equatable {
  final String title;
  final LatLng coordinate;

  const Poi(this.title, this.coordinate);

  @override
  List<Object> get props => [title, coordinate];

  static List<Marker> getMarkers(List<Poi> poiList, Image image) {
    return List.generate(
      poiList.length,
          (index) => Marker(
        point: poiList[index].coordinate,
        child: image,
        width: 50,
        height: 50,
        alignment: Alignment.center,
      ),
    );
  }
}
