// ignore_for_file: prefer_const_constructors


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_cloneyoutube/screens/bottombar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Get.off(() => BottomBar());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: SvgPicture.asset("assets/images/youtube.svg",width: 120,),
        ),
      ),
    );
  }
}
