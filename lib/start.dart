import 'dart:async';

import 'package:bitcoinapp/currency.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Currency()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 175,
          ),
          Image(
            image: AssetImage("images/12.png"),
            height: 100,
            width: 100,
          ),
          Center(
            child: Text(
              'Crypto Converter App',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: Text(
              'Check Current Conversion',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            'by Saddam Hossain Shamrat',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Center(
            child: SpinKitCircle(
              color: Colors.blueAccent,
              size: 50,
              //duration: Duration(milliseconds: 3000),
            ),
          ),
        ],
      ),
    );
  }
}
