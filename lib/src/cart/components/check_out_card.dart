import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/res/icons_utils.dart';
import 'package:flutter_dio/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/my_application.dart';
import '../../../utils/size_config.dart';


class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenWidth(15),
          horizontal: getProportionateScreenWidth(30),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: appColor.white,
          borderRadius:const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset:const Offset(0, -15),
              blurRadius: 20,
              color: appColor.grayshade.withOpacity(0.9),
            )
          ],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text.rich(
                    TextSpan(
                      text: "Grand Total:\n",
                      children: [
                        TextSpan(
                          text: "\$ ${app.appController.grandTotalPrice}",
                          style: const TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                       style: ElevatedButton.styleFrom(backgroundColor: appColor.main),
                      onPressed: () {},
                    child: const Text('Dispatched'),
                  ),
                ],
              ),
            ],
          ),
        ),

      );});
  }
}
