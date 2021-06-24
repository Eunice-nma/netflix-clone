import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/HomePage.dart';
// import 'package:netflix_clone/pages/MyListPage.dart';
// import 'pages/InfoPage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: HomePage(),
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

