import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottonbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'l one',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBar(),
    );
  }
}