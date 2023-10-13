import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/res/icons_utils.dart';
import 'package:flutter_dio/utils/widget_util.dart';


import '../../res/strings.dart';
import '../../utils/size_config.dart';
import '../widgets/socal_card.dart';
import 'component/sign_up_form.dart';


class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.bgColor,
      appBar: AppBar(
        title: Text(strings.LABEL_SIGNUP),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WidgetUtil.normalVerticalSpace(),
                  const Text( "Complete your details",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),

                  ),
            WidgetUtil.normalVerticalSpace(height: 30),
                  SignUpForm(),
                  WidgetUtil.normalVerticalSpace(height: SizeConfig.screenHeight * 0.08),
                  Visibility(
                    visible: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocalCard(
                          icon: iconUtils.fb_icon,
                          press: () {},
                        ),
                        SocalCard(
                          icon: iconUtils.google_icon,
                          press: () {},
                        ),
                        SocalCard(
                          icon: iconUtils.twitter_icon,
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                  WidgetUtil.normalVerticalSpace(height:20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}