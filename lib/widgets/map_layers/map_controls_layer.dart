import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapControlsLayer extends StatelessWidget {
  const MapControlsLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = MapController.of(context);
    final mapCamera = MapCamera.of(context);

    Future<LocationData?> getCurrentLocation() async {
      Location location = Location();

      var serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return null;
        }
      }

      var permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return null;
        }
      }

      return await location.getLocation();
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
              heroTag: 'curLocationButton',
              onPressed: () async {
                final currentLocation = await getCurrentLocation();
                final latitude = currentLocation?.latitude;
                final longitude = currentLocation?.longitude;

                if (currentLocation != null && latitude != null && longitude != null ) {
                  mapController.move(LatLng(latitude, longitude), mapCamera.zoom);
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