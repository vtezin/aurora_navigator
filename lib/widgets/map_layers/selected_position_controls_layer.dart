import 'package:aurora_navigator/services/route_service/route_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aurora_navigator/services/selected_position/selected_position_notifier.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class SelectedPositionControlsLayer extends StatelessWidget {
  const SelectedPositionControlsLayer({super.key});

  @override
  Widget build(BuildContext context) {
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
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: FloatingActionButton(
              heroTag: 'getRoute',
              onPressed: () async {
                final selectedPositionProvider = Provider.of<SelectedPositionNotifier>(context, listen: false);
                if (selectedPositionProvider.selectedPosition == null) {
                  return;
                }
                final currentLocation = await getCurrentLocation();

                Provider.of<RouteNotifier>(context, listen: false).getRoute(LatLng(currentLocation.latitude, currentLocation.longitude),
                    selectedPositionProvider.selectedPosition!);
              },
              child: Icon(Icons.route),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
            child: FloatingActionButton(
              heroTag: 'getRoute',
              onPressed: () async {
                Provider.of<SelectedPositionNotifier>(context, listen: false)
                    .setAndNotify(null);

              },
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}