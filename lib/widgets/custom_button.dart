import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/widgets/text_styles.dart';

class SimpleButton extends StatefulWidget {

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
  _SimpleButtonState createState() => _SimpleButtonState();
}

class _SimpleButtonState extends State<SimpleButton> {
  bool _isPressed = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Material(

      elevation: widget.isFadedStyle ?0:3,
          color: _isPressed ? widget.isFadedStyle ? widget.buttonColor.withOpacity(0.1):widget.buttonColor.withOpacity(0.8) : widget.isFadedStyle ? widget.buttonColor.withOpacity(0.2):widget.buttonColor,
          borderRadius: BorderRadius.circular(8.0),
      //  onPressed: onTap,
        child:  InkWell(
          onTapDown: (_) {
            setState(() {
              _isPressed = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isPressed = false;
            });
            widget.onTap();
          },

          child: Center(
            child: Text(
              widget.text,
              style:widget.isFadedStyle ? KTextStyle.colorTextStyle(widget.buttonColor): KTextStyle.authButtonTextStyle,
            ),
          ),
        )
      ),
    );
  }
}
