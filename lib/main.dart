import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:golotlo/pages.dart';
import 'package:golotlo/pages/HomePage.dart';
import 'package:golotlo/pages/ProductPage.dart';
import 'package:golotlo/pages/SignUp.dart';
import 'package:golotlo/pages/samepages/FoodBeverage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var firstCamera;
    // salama() async {
    //   // Obtain a list of the available cameras on the device.
    //   final cameras = await availableCameras();

    //   // Get a specific camera from the list of available cameras.
    //   firstCamera = cameras.first;
    // }

    return MaterialApp(
        title: 'Just a Title',
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
