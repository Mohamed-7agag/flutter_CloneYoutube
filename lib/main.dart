// ignore_for_file: prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_cloneyoutube/component/box.dart';
import 'package:flutter_application_cloneyoutube/constant.dart';
import 'package:flutter_application_cloneyoutube/screens/bottombar.dart';
import 'package:flutter_application_cloneyoutube/screens/homescreen.dart';
import 'package:flutter_application_cloneyoutube/screens/splashscreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'youtube Clone',
      home: SplashScreen() ,
    );
  }
}

