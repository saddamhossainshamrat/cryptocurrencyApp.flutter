import 'package:bitcoinapp/start.dart';
import 'package:flutter/material.dart';
import 'currency.dart';

void main(List<String> args) {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0XFF0D0C22),
        ),
        scaffoldBackgroundColor: Color(0XFF272822),
      ),
      home: Start(),
    );
  }
}
