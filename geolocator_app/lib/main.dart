import 'package:flutter/material.dart';
import 'package:geolocator_app/location.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  Location location = Location();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              Location location = Location();
              await location.getCurrentLocation();
              debugPrint('Latitude: ${location.latitude}');
              debugPrint('Longitude: ${location.longitude}');
            },
            child: const Text('Get Location'),
          ),
        ),
      ),
    );
  }
}
