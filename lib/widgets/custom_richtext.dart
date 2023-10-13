import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';


class CustomRichText extends StatelessWidget {
  final String discription;
  final String text;
  final Function() onTap;
  final double textSize;
  final TextAlign textAlign;
  const CustomRichText(
      {Key? key,
      required this.discription,
      required this.text,
      required this.onTap,
        this.textSize = 16,
      this.textAlign = TextAlign.start})
      : super(key: key);
// "Don't already Have an account? "
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign :textAlign,
      TextSpan(
          text: discription,
          style:  TextStyle(color: Colors.black87, fontSize: textSize),
          children: [
            TextSpan(
                text: text,
                style:  TextStyle(color: appColor.blue, fontSize: textSize),
                recognizer: TapGestureRecognizer()..onTap = onTap),
          ]),
    );
  }
}
