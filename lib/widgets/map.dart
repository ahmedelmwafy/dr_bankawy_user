import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final double latLng;
  final double long;

  const MapSample({Key key, this.latLng, this.long}) : super(key: key);
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  // ignore: prefer_const_constructors
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: const LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // static  final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(widget.latLng,widget.long),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
                zoom: 19.151926040649414,
                tilt: 59.440717697143555,
                bearing: 192.8334901395799,
                target: LatLng(
                  widget.latLng,
                  widget.long,
                )),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ),
      ],
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
