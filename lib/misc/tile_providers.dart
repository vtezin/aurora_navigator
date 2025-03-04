import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

TileLayer get openStreetMapTileLayer => TileLayer( // Bring your own tiles
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
  userAgentPackageName: 'com.example.aurora', // Add your app identifier
  tileProvider: CancellableNetworkTileProvider(),
);
