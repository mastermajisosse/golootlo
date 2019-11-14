import 'package:flutter/material.dart';
import 'package:golotlo/pages/ChatTabScreen.dart';
import 'package:golotlo/pages/CodeTafiil.dart';
import 'package:golotlo/pages/HomePage.dart';
import 'package:golotlo/pages/Location.dart';
import 'package:golotlo/pages/NumChat.dart';
import 'package:golotlo/pages/ProductPage.dart';
import 'package:golotlo/pages/Qr.dart';
import 'package:golotlo/pages/SignUp.dart';
import 'package:golotlo/pages/chat.dart';
import 'package:golotlo/pages/enterNum.dart';
import 'package:golotlo/pages/samepages/FoodBeverage.dart';

class AnotherPage extends StatefulWidget {
  @override
  _AnotherPageState createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ink("foodBev", FoodBev(), Colors.blue[100]),
              ink("chat", ChatTabScreen(), Colors.blue[200]),
              ink("chatTab", ChatTabScreen(), Colors.blue[300]),
              ink("code", MyHome(), Colors.blue[400]),
            ],
          ),
          Row(
            children: <Widget>[
              ink("Num", EnterNum(), Colors.blue[500]),
              ink("Home", HomePage(), Colors.blue[600]),
              ink("Location", Location(), Colors.blue[700]),
              ink("Product", ProductPage(), Colors.blue[800]),
            ],
          ),
          Row(
            children: <Widget>[
              // ink("num", EnterNum(), Colors.green[500]),
              ink("Qr", TakePictureScreen(), Colors.green[600]),
              ink("NChat", NumChat(), Colors.green[700]),
              ink("SignUp", SignUpPage(), Colors.green[800]),
            ],
          ),
        ],
      ),
    );
  }

  Widget ink(txt, tooo, colo) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => tooo,
      )),
      child: Container(
        width: 100,
        height: 100,
        color: colo,
        alignment: Alignment.center,
        child: Text(
          txt,
          style: TextStyle(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
