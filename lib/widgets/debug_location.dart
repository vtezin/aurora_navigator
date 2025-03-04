import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class DebugLocation extends StatefulWidget {
  const DebugLocation({super.key});

  @override
  State<DebugLocation> createState() => _State();
}

class _State extends State<DebugLocation> {
  @override
  Widget build(BuildContext context) {
    Position? _currentLocation;
    late bool servicePermission = false;
    late LocationPermission permission;

    Future<Position> _getCurrentLocation() async {
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

    return Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  _currentLocation = await _getCurrentLocation();
                  print("$_currentLocation");
                },
                child: const Text('Get location')
            )
          ],
        )
    );
  }
}
