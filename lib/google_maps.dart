import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsState();
}

class _MapsState extends State<MapsPage> {

  static const LatLng initialPosition = LatLng(28.689770, 77.175232);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Google Map'),
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialPosition,
          zoom: 14,
          tilt: 2,
          bearing: 2,
        ),
      ),
    );
  }
}
