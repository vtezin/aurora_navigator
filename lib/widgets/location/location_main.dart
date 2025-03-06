// import 'package:example/change_settings.dart';
// import 'package:example/enable_in_background.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
//import 'package:url_launcher/url_launcher.dart';

// import 'change_notification.dart';
// import 'get_location.dart';
import 'listen_location.dart';
// import 'permission_status.dart';
// import 'service_enabled.dart';

class LocationHomePage extends StatefulWidget {
  const LocationHomePage({super.key, this.title});
  final String? title;

  @override
  _LocationHomePageState createState() => _LocationHomePageState();
}

class _LocationHomePageState extends State<LocationHomePage> {
  final Location location = Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: const Column(
            children: [
              // PermissionStatusWidget(),
              // Divider(height: 32),
              // ServiceEnabledWidget(),
              // Divider(height: 32),
              // GetLocationWidget(),
              // Divider(height: 32),
              ListenLocationWidget(),
              // Divider(height: 32),
              // ChangeSettings(),
              // Divider(height: 32),
              // EnableInBackgroundWidget(),
              // Divider(height: 32),
              // ChangeNotificationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}