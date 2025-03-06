import 'dart:async';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

class LocationDataStreamFactory {
  final Location location = Location();

  StreamSubscription<LocationData>? _locationSubscription;

  final StreamController<LocationMarkerPosition?> positionStreamController =
      StreamController();

  Future<void> listenLocation() async {
    _locationSubscription =
        location.onLocationChanged.handleError((dynamic err) {
      if (err is PlatformException) {
        //_error = err.code;
      }
      _locationSubscription?.cancel();
      _locationSubscription = null;
    }).listen((currentLocation) {
      positionStreamController
        .add(
          LocationMarkerPosition(
            latitude: currentLocation.latitude ?? 0,
            longitude: currentLocation.longitude ?? 0,
            accuracy: 0,
          ),
        );
    });
  }

  Future<void> stopListen() async {
    await _locationSubscription?.cancel();
    _locationSubscription = null;
  }
}
