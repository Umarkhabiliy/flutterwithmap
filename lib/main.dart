import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WorkWithMap());
  }
}

class WorkWithMap extends StatelessWidget {
  WorkWithMap({Key? key}) : super(key: key);

  late GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();

  final LatLng center = const LatLng(41.4234324523, 69.4234234234);
  final CameraPosition kLake = const CameraPosition(
      target: LatLng(
        37.4234234,
        32.54345345,
      ),
      bearing: 192.23423324,
      tilt: 42.3423,
      zoom: 19.23234);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Map"),
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(
              41.23435,
              69.423432,
            ),
            zoom: 11.0),
      ),
    );
  }

  Future<void> _goToTakeLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }
}
