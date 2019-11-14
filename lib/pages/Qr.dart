import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  Future<String> barcodString;

  @override
  void initState() {
    super.initState();
    setState(() {
      barcodString = new QRCodeReader()
          .setAutoFocusIntervalInMs(200) // default 5000
          .setForceAutoFocus(true) // default false
          .setTorchEnabled(true) // default false
          .setHandlePermissions(true) // default true
          .setExecuteAfterPermissionGranted(true) // default true
          .scan();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 6,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue[700],
            ),
          ),
          title: Text(
            "Qr",
            style: TextStyle(
              color: Color(0xFF2196f3),
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                child: Icon(
                  Icons.message,
                  color: Color(0xFF2196f3),
                  size: 26,
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            FutureBuilder(
              future: barcodString,
              builder: (
                BuildContext context,
                AsyncSnapshot<String> snapshot,
              ) {
                return Text(snapshot.data != null ? snapshot.data : '');
              },
            )
          ],
          // child: ,
        ));
  }
}
