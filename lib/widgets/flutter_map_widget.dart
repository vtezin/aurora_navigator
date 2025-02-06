import 'package:aurora_navigator/misc/tile_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FlutterMapWidget extends StatelessWidget {
  const FlutterMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(55.54859, 37.55487), // Center the map over Butovo
        initialZoom: 12,
      ),
      children: [
        openStreetMapTileLayer,
        RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => print(""), // (external)
            ),
            // Also add images...
          ],
        ),
      ],
    );
  }
}