import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Getx api call',
      theme: ThemeData(
        primarySwatch: Colors.grey,visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //initialBinding: ControllerBindings(),
      home: const Home(),
    );
  }
}
