import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  Completer<GoogleMapController> _comtroller = Completer();

  static const LatLng _center =
      const LatLng(37.42796133580664, -122.085749655962);

  final Set<Marker> _marker = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller) {
    _comtroller.complete(controller);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Widget button(Function function, IconData icon) {
    return FloatingActionButton(
      onPressed: function,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(icon, size: 36),
    );
  }

  _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _marker.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow:
              InfoWindow(title: 'this is title', snippet: 'this is snippet'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 14.4746,
              ),
              mapType: _currentMapType,
              markers: _marker,
              onCameraMove: _onCameraMove,
            ),
            // Padding(
            //   padding: EdgeInsets.all(16),
            //   child: Align(
            //     alignment: Alignment.topRight,
            //     child: Column(
            //       children: <Widget>[
            //         button(_onMapTypeButtonPressed, Icons.map),
            //         SizedBox(
            //           height: 16,
            //         ),
            //         button(_onAddMarkerButtonPressed, Icons.map),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
