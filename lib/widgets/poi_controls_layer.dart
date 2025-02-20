import 'dart:math';
import 'package:aurora_navigator/model/poi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class PoiControlsLayer extends StatelessWidget {
  const PoiControlsLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: FloatingActionButton(
              heroTag: 'coffee',
              onPressed: () async {

              },
              child: Icon(Icons.coffee),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: FloatingActionButton(
              heroTag: 'hotels',
              onPressed: () async {

              },
              child: Icon(Icons.hotel),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
            child: FloatingActionButton(
              heroTag: 'gasStations',
              onPressed: () async {
                final poiList = await Poi.getPoiAround(LatLng(55.7967432, 37.5373542));
                print("${poiList}");
              },
              child: Icon(Icons.local_gas_station),
            ),
          ),
        ],
      ),
    );
  }
}