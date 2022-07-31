// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'page/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: HomePage());
  }
}
