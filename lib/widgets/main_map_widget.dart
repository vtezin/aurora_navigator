import 'package:aurora_navigator/misc/tile_providers.dart';
import 'package:aurora_navigator/model/poi.dart';
import 'package:aurora_navigator/services/poi_service/poi_notifier.dart';
import 'package:aurora_navigator/services/route_service/route_notifier.dart';
import 'package:aurora_navigator/services/selected_position/selected_position_notifier.dart';
import 'package:aurora_navigator/widgets/map_layers/address_search_layer.dart';
import 'package:aurora_navigator/widgets/map_layers/map_controls_layer.dart';
import 'package:aurora_navigator/widgets/map_layers/poi_controls_layer.dart';
import 'package:aurora_navigator/widgets/map_layers/selected_position_controls_layer.dart';
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

  final _mapInitialCenter =
      LatLng(55.547781, 37.541063); // Center the map over Butovo
  final double _mapInitialZoom = 15;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SelectedPositionNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => PoiNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => RouteNotifier(),
        )
      ],
      child: Scaffold(body: Builder(builder: (BuildContext context) {
        return FlutterMap(
          options: MapOptions(
            onTap: (TapPosition tapPosition, LatLng point) {
              Provider.of<SelectedPositionNotifier>(context, listen: false)
                  .setAndNotify(point);
            },
            initialCenter: _mapInitialCenter,
            initialZoom: _mapInitialZoom,
          ),
          children: [
            openStreetMapTileLayer,

            Consumer<RouteNotifier>(
              builder: (_, value, __) {
                final polyline = Polyline(
                points: value.route,
                strokeWidth: 5,
                color: Colors.green,
                borderStrokeWidth: 1,
                borderColor: Colors.greenAccent,
                );

                return PolylineLayer(
                  polylines: [polyline],
                );
              },
            ),

            Consumer<PoiNotifier>(
              builder: (_, value, __) {
                final markers = Poi.getMarkers(
                    value.poiList, Image.asset('assets/cafe_icon.png'));
                return MarkerLayer(markers: markers);
              },
            ),
            Consumer<SelectedPositionNotifier>(
              builder: (_, value, __) {
                if (value.selectedPosition != null) {
                  final marker = Marker(
                    point: value.selectedPosition!,
                    child: Icon(Icons.location_on, color: Colors.redAccent),
                    // width: 50,
                    // height: 50,
                    alignment: Alignment.center,
                  );
                  return MarkerLayer(markers: [marker]);
                } else {
                  return MarkerLayer(markers: []);
                }
              },
            ),

            //SelectedPositionControlsLayer(),

            Consumer<SelectedPositionNotifier>(
              builder: (_, value, __) {
                if (value.selectedPosition != null) {
                  return SelectedPositionControlsLayer();
                } else {
                  return MarkerLayer(markers: []);
                }
              },
            ),

            CurrentLocationLayer(
              positionStream: _positionStream,
              //alignPositionOnUpdate: AlignOnUpdate.always,
            ),
            const MapControlsLayer(),
            PoiControlsLayer(),
            AddressSearchLayer(),
          ],
        );
      })),
    );
  }
}
