import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapControlsLayer extends StatelessWidget {
  const MapControlsLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = MapController.of(context);
    final mapCamera = MapCamera.of(context);

    Position? currentLocation;
    late bool servicePermission = false;
    late LocationPermission permission;

    Future<Position> getCurrentLocation() async {
      await Geolocator.isLocationServiceEnabled();
      if (!servicePermission) {
        print("service disabled");
      }

      permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      return await Geolocator.getCurrentPosition();
    }

    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: FloatingActionButton(
              heroTag: 'zoomInButton',
              onPressed: () {
                final zoom = min(mapCamera.zoom + 1, 19.0);
                mapController.move(mapCamera.center, zoom);
              },
              child: Icon(Icons.zoom_in),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: FloatingActionButton(
              heroTag: 'zoomOutButton',
              onPressed: () {
                final zoom = max(mapCamera.zoom - 1, 1.0);
                mapController.move(mapCamera.center, zoom);
              },
              child: Icon(Icons.zoom_out),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
            child: FloatingActionButton(
              heroTag: 'zoomOutButton',
              onPressed: () async {
                currentLocation = await getCurrentLocation();
                if (currentLocation != null) {
                  mapController.move(LatLng(currentLocation!.latitude, currentLocation!.longitude), mapCamera.zoom);
                }
              },
              child: Icon(Icons.near_me),
            ),
          ),
        ],
      ),
    );
  }
}