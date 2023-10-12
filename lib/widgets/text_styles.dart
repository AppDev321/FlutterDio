import 'package:flutter/material.dart';

import '../res/app_color.dart';


class KTextStyle {
  static  var headerTextStyle = TextStyle(
      color: appColor.whiteshade, fontSize: 28);

  static var textFieldHeading =
      TextStyle(color: Colors.black, fontSize: 16);

  static var textFieldHintStyle = TextStyle(
      color: appColor.hintText, fontSize: 14);

  static var authButtonTextStyle = TextStyle(
      fontSize: 18, color: appColor.whiteshade);

  static  colorTextStyle (Color color){
    return TextStyle(fontSize: 18, color: color);
  }
}
