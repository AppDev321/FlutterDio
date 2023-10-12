import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/widgets/text_styles.dart';


class SimpleButton extends StatelessWidget {
  final String text;
  final Function() onTap;
   Color buttonColor;
   bool isFadedStyle;


   SimpleButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.buttonColor = mainAppColor,
   this.isFadedStyle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        margin: const EdgeInsets.only(left: 20, right: 20),
        decoration:  BoxDecoration(
            color: isFadedStyle?buttonColor.withOpacity(0.2):buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
          child: Text(
            text,
            style:isFadedStyle?KTextStyle.colorTextStyle(buttonColor): KTextStyle.authButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
