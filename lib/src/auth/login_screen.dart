import 'package:flutter/material.dart';
import 'package:flutter_dio/src/auth/signup_screen.dart';
import 'package:flutter_dio/src/home_page.dart';
import 'package:flutter_dio/widgets/custom_button.dart';
import 'package:get/get.dart';

import '../../res/app_color.dart';
import '../../res/icons_utils.dart';
import '../../res/strings.dart';
import '../../utils/widget_util.dart';
import '../../widgets/custom_formfield.dart';
import '../../widgets/custom_richtext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text.trim();

  String get password => _passwordController.text.trim();

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: appColor.bgColor,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: appColor.bgColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.09),
                      child: Image.asset(iconUtils.WELCOME_ICON),
                    ),
                    WidgetUtil.normalVerticalSpace(height: 24),
                    Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          strings.LABEL_WELCOME_BACK,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 24, color: mainAppColor,fontWeight: FontWeight.bold),
                        )),
                    WidgetUtil.normalVerticalSpace(height: 24),
                    CustomFormField(
                      headingText: strings.LABEL_EMAIL,
                      hintText: strings.LABEL_EMAIL,
                      obsecureText: false,
                      suffixIcon: const SizedBox(),
                      controller: _emailController,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                    ),
                    WidgetUtil.normalVerticalSpace(),
                    CustomFormField(
                      headingText: strings.LABEL_PASSWORD,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      hintText: strings.LABEL_PASSWORD,
                      obsecureText: isPasswordVisible,
                      suffixIcon: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          isPasswordVisible = !isPasswordVisible;
                          setState(() {});
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,

                        ),
                      ),
                      controller: _passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          child: InkWell(
                            onTap: () {},
                            child: Visibility(
                              visible: false,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: appColor.blue.withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SimpleButton(
                      onTap: () {
                        Get.to(()=>HomePage());
                      },
                      text: strings.LABEL_LOGIN,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, right: 20),
                      width: Get.width,
                      child: CustomRichText(
                        textAlign: TextAlign.end,
                        textSize: 13,
                        discription: "Don't already Have an account? ",
                        text: strings.LABEL_SIGNUP,
                        onTap: () {
                          Get.to(() => SignUpScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
