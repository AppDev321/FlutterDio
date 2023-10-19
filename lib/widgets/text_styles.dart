import 'package:flutter/material.dart';

import '../res/app_color.dart';


class KTextStyle {
  static  var headerTextStyle = TextStyle( color: appColor.whiteshade, fontSize: 28);

  static var textFieldHeading =  const TextStyle(color: Colors.black, fontSize: 16);

  static var textFieldHintStyle = TextStyle(  color: appColor.hintText, fontSize: 14);

  static var authButtonTextStyle = TextStyle( fontSize: 16, color: appColor.whiteshade,fontWeight: FontWeight.normal);

  static  colorTextStyle (Color color){  return TextStyle(fontSize: 16, color: color,fontWeight: FontWeight.normal); }
  static var textBottomMenu =   TextStyle(color: appColor.whiteshade, fontSize: 12);


  BoxDecoration kContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15.0),
  );

  static TextStyle kLoginTextStyle = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
  );

  static BoxDecoration kOtherLoginDecoration = BoxDecoration(
    border: Border.all(color: Colors.black26),
    borderRadius: BorderRadius.circular(10.0),
    color: Colors.white24,
  );

  static ButtonStyle kButtonStyle = TextButton.styleFrom(
      backgroundColor: const Color(0xff284BC1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ));

  static InputBorder kInputFieldStyle = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  );
}
