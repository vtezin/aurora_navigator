import 'package:aurora_navigator/misc/tile_providers.dart';
import 'package:aurora_navigator/model/poi.dart';
import 'package:aurora_navigator/services/poi_service/poi_service_notifier.dart';
import 'package:aurora_navigator/model/route.dart';
import 'package:aurora_navigator/services/selected_position/selected_position_notifier.dart';
import 'package:aurora_navigator/widgets/map_layers/address_search_layer.dart';
import 'package:aurora_navigator/widgets/map_layers/map_controls_layer.dart';
import 'package:aurora_navigator/widgets/map_layers/poi_controls_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

class MainMapWidget extends StatefulWidget {
  const MainMapWidget({super.key});

  @override
  State<MainMapWidget> createState() => _MainMapWidgetState();
}

class _MainMapWidgetState extends State<MainMapWidget> {
  final _positionStream =
      const LocationMarkerDataStreamFactory().fromGeolocatorPositionStream(
    stream: Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 1,
        timeLimit: Duration(minutes: 1),
      ),
    ),
  );

  final _poiListNotifier = PoiServiceNotifier();
  final selectedPositionNotifier = SelectedPositionNotifier();

  final _mapInitialCenter = LatLng(55.547781, 37.541063);// Center the map over Butovo
  final double _mapInitialZoom = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: _mapInitialCenter,
          initialZoom: _mapInitialZoom,
        ),
        children: [
          openStreetMapTileLayer,
          PolylineLayer(
            polylines: [MapRoute.getTestRoute()],
          ),

          ChangeNotifierProvider(
            create: (_) {
              return _poiListNotifier;
            },
            child: Consumer<PoiServiceNotifier>(
              builder: (_, value, __) {
                final markers = Poi.getMarkers(
                    value.poiList, Image.asset('assets/cafe_icon.png'));
                return MarkerLayer(markers: markers);
              },
            ),
          ),

          ChangeNotifierProvider(
            create: (_) {
              return selectedPositionNotifier;
            },
            child: Consumer<SelectedPositionNotifier>(
              builder: (_, value, __) {
                if (value.selectedPosition != null) {
                  final marker = Marker(
                    point: value.selectedPosition!,
                    child: Icon(Icons.zoom_in),
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                  );
                  return MarkerLayer(markers: [marker]);
                } else {
                  return MarkerLayer(markers: []);
                }
              },
            ),
          ),

          CurrentLocationLayer(
            positionStream: _positionStream,
            //alignPositionOnUpdate: AlignOnUpdate.always,
          ),
          const MapControlsLayer(),
          PoiControlsLayer(poiListNotifier: _poiListNotifier),
          AddressSearchLayer(),
        ],
      ),
    );
  }
}
