import 'package:flutter/material.dart';
import 'package:flutter_dio/res/icons_utils.dart';
import 'package:flutter_dio/utils/widget_util.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         // ProfilePic(),
          WidgetUtil.normalVerticalSpace(height: 20),
         /* ProfileMenuButton(
            text: "My Account",
            icon:iconUtils.ic_user,
            press: () => {},
          ),*/
          /* ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),*/
          ProfileMenuButton(
            text: "Help Center",
            icon: iconUtils.ic_help_center,
            press: () {},
          ),
          ProfileMenuButton(
            text: "Log Out",
            icon: iconUtils.ic_logout,
            press: () {},
          ),
        ],
      ),
    );
  }
}
