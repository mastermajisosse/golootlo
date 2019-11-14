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

            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue[700],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 10, right: 10),
              child: Container(
                alignment: Alignment.topCenter,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    style: TextStyle(fontSize: 20, height: 1),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      disabledBorder: InputBorder.none,
                      filled: true,
                      labelText: " بحت ..",
                      hintText: " بحت ..",
                      prefixIcon: Icon(Icons.search),
                      border: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.white),
                        borderRadius: new BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18, bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  // elevation: 0,
                  minWidth: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Color(0xFF2196f3),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'تاكيد',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            height: 1),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
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
