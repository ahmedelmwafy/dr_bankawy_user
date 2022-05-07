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
  final Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GoogleMap(
            markers: myMarker(),
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

  Set<Marker> myMarker() {
    setState(() {
      markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(LatLng(widget.latLng, widget.long).toString()),
        position: LatLng(widget.latLng, widget.long),
        infoWindow: const InfoWindow(
          title: 'Work Space',
          snippet: 'Beautiful Choice',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    return markers;
  }
}
