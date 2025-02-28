import 'package:aurora_navigator/services/geocoder_service.dart';
import 'package:aurora_navigator/services/selected_position/selected_position_notifier.dart';
import 'package:aurora_navigator/services/suggest_service/suggest_service_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class AddressSearchLayer extends StatefulWidget {
  const AddressSearchLayer({super.key});

  @override
  State<AddressSearchLayer> createState() => _AddressSearchLayerState();
}

class _AddressSearchLayerState extends State<AddressSearchLayer> {
  final suggestServiceNotifier = SuggestServiceNotifier();

  @override
  Widget build(BuildContext context) {
    final mapController = MapController.of(context);

    final textFieldController = TextEditingController();

    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: textFieldController,
                onChanged: (value) async {
                  await suggestServiceNotifier.getSuggests(
                      mapController.camera.center, value);
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Поиск',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              ChangeNotifierProvider(
                create: (_) {
                  return suggestServiceNotifier;
                },
                child: Consumer<SuggestServiceNotifier>(
                  builder: (_, value, __) {
                    final foundItems = suggestServiceNotifier.resultsList;
                    return Expanded(
                      child: foundItems.isNotEmpty
                          ? ListView.builder(
                        itemCount: foundItems.length,
                        itemBuilder: (context, index) => Card(
                          key: ValueKey(foundItems[index].name),
                          color: Colors.white,
                          elevation: 4,
                          margin:
                          const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text(foundItems[index].name),
                            subtitle: Text(foundItems[index].address),
                            onTap: () async {
                              final coordinate = await GeocoderService
                                  .getCoordinateOfAddress(
                                  foundItems[index].address);
                              if (coordinate != null) {
                                textFieldController.clear();
                                suggestServiceNotifier.clearSuggests();
                                mapController.move(
                                    LatLng(coordinate.latitude,
                                        coordinate.longitude),
                                    16);
                                Provider.of<SelectedPositionNotifier>(context, listen: false).setAndNotify(coordinate);
                                // final notifier = context.read<SelectedPositionNotifier>();
                                // notifier.setAndNotify(coordinate);
                              }
                            },
                          ),
                        ),
                      )
                          : const Text(''),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
