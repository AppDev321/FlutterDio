

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/res/icons_utils.dart';
import 'package:flutter_dio/src/startup/startup_screen.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/strings.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2750), vsync: this);
    animation = ColorTween(begin: appColor.nearlyWhite, end: appColor.nearlyWhite)
        .animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });

    Timer(const Duration(milliseconds: 3500), () {
      Get.off(
            () => StartupScreen(),
        duration: const Duration(milliseconds: 100),
        transition: Transition.fade,
      );
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 200,

                child: Image.asset(iconUtils.WELCOME_ICON)),
            WidgetUtil.normalVerticalSpace(height: 20),
            Text(
                strings.app_name,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),

            )
          ],
        ),
      ),
    );
  }
}