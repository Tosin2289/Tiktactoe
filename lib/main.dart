import 'package:flutter/material.dart';

import 'package:tiktaktoe/screens/homepage.dart';
import 'package:tiktaktoe/screens/intro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Intro(),
    );
  }
}
