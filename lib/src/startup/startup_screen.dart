import 'package:flutter/material.dart';
import 'package:flutter_dio/res/icons_utils.dart';
import 'package:flutter_dio/res/strings.dart';
import 'package:flutter_dio/src/auth/login_screen.dart';
import 'package:flutter_dio/src/auth/signup_screen.dart';
import 'package:flutter_dio/widgets/custom_button.dart';
import 'package:get/get.dart';
import '../../res/app_color.dart';
import '../../utils/my_application.dart';



class StartupScreen extends StatefulWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: appColor.bgColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.09),
                child: Image.asset(iconUtils.WELCOME_ICON),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  width:MediaQuery.of(context).size.width,
                  child: Text(strings.LABEL_WELCOME_MSG, textAlign: TextAlign.center,style:const TextStyle(fontSize: 24),)),
              const SizedBox(
                height: 24,
              ),
              SimpleButton(
                onTap: () {

                  app.navigationTransitionScreen(LoginScreen());

                },
                text: strings.LABEL_ALREADY_ACCOUNT,
              ),
              const SizedBox(
                height: 24,
              ),
              SimpleButton(
                onTap: () {

                  app.navigationTransitionScreen(SignUpScreen());
                },
                text: strings.LABEL_NEW_ACCOUNT,
                buttonColor: appColor.lightblue,
                isFadedStyle: true,
              ),

            ],
          ),

        ],
      )),
    );
  }
}
