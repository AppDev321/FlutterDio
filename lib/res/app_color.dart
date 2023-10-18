import 'dart:math';

import 'package:flutter/material.dart';

AppColor appColor = AppColor();

class AppColor {
  static final AppColor _appColor = AppColor._i();

  factory AppColor() {
    return _appColor;
  }

  AppColor._i();

  final Color main = Color(0xFF404CCC);
  final Color primaryColor = Color(0xFF5297F4);
  final Color primaryDarkColor = Color(0xFF5297F4);
  final Color primaryLightColor = Color(0xFF5297F4);
  final Color primaryLight = Color(0xFF5297F4);
  final Color accentColor = Color(0xff39446F);

  final Color bgColor = Colors.white;

  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color transparent = Colors.transparent;

  final Color grey = Color(0xff898989);
  final Color greyDark = Color(0xFF424242);
  final Color greyLight = Color(0xff898989);
  final Color pink = Color(0xFFFF4081);

  final Color notWhite = Color(0xFFEDF0F2);
  final Color notWhite2 = Color(0xFFF6F6F6);
  final Color nearlyWhite = Color(0xFFFEFEFE);


  final Color lightsky = Color(0xFFA6C0FF);
  final Color whiteshade = Color(0xFFF8F9FA);
  final Color blue = Color(0xFF497fff);
  final Color lightblueshade = Color(0xFF758CC8);
  final Color grayshade = Color(0xFFEBEBEB);
  final Color lightblue = Color(0xFF4B68D1);
  final Color blackshade = Color(0xFF555555);
  final Color hintText = Color(0xFFC7C7CD);



  Color hexToColor(String code) {
    return  Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Color generateRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];

  }
}

  const Color mainAppColor = Color(0xFF404CCC);
