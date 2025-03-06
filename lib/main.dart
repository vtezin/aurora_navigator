import 'package:aurora_navigator/widgets/location/listen_location.dart';
import 'package:aurora_navigator/widgets/location/location_main.dart';
import 'package:aurora_navigator/widgets/main_map_widget.dart';
import 'package:aurora_navigator/widgets/main_map_widget_new.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainMapWidgetNew(),
      //home: const LocationHomePage(title: "Location"),
      //home: const MainMapWidget(),
      //home: const DebugLocation(),
      //home: const DebugWidget(),
    );
  }
}