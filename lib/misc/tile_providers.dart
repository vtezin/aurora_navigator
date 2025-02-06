import 'package:flutter_map/flutter_map.dart';

TileLayer get openStreetMapTileLayer => TileLayer( // Bring your own tiles
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
  userAgentPackageName: 'com.example.aurora', // Add your app identifier
  // And many more recommended properties!
);
