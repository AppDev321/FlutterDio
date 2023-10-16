import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/res/icons_utils.dart';
import 'package:flutter_dio/utils/widget_util.dart';

import '../../../../utils/size_config.dart';



class ItemStock extends StatelessWidget {
  final int index;


  ItemStock({required this.index});

  @override
  Widget build(BuildContext context) {
      return Card(
          elevation: 0,
          color: appColor.lightblueshade.withOpacity(0.5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(iconUtils.ic_shoes),
                    ),
                  ),
                ),
                WidgetUtil.normalHorizontalSpace(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Test Item",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    WidgetUtil.normalVerticalSpace(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "300 Qr",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.black54),
                        children: [
                          TextSpan(
                              text: " x4",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    )
                  ],
                ),
                WidgetUtil.normalVerticalSpace(),

              ],
    ),
              WidgetUtil.normalVerticalSpace(),
              Container(height: 1,color: mainAppColor,),
              WidgetUtil.normalVerticalSpace(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time_sharp,color: mainAppColor,),
                      WidgetUtil.normalHorizontalSpace(),
                      Text("10-10-2023")
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.access_time_sharp,color: mainAppColor,),
                      WidgetUtil.normalHorizontalSpace(),
                      Text("10-10-2023")
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );

  }
}
