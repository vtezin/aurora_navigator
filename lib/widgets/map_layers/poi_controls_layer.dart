import 'package:aurora_navigator/services/poi_service/poi_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';

class PoiControlsLayer extends StatelessWidget {
  const PoiControlsLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = MapController.of(context);

    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, right: 10),
            child: FloatingActionButton(
              heroTag: 'coffee',
              onPressed: () async {
                Provider.of<PoiNotifier>(context).getPoiAround(mapController.camera.center, 'food/cafe');
              },
              child: Icon(Icons.coffee),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
            child: FloatingActionButton(
              heroTag: 'gasStations',
              onPressed: () async {
                Provider.of<PoiNotifier>(context).getPoiAround(mapController.camera.center, 'shop/general/general');
              },
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
    );
  }
}