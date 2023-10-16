import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/models/product_model.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/utils/my_application.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_dio/widgets/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/strings.dart';



class ItemDispatched extends StatelessWidget {
  final int index;


  ItemDispatched({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        color: appColor.lightblueshade.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetUtil.normalVerticalSpace(height: 20),
             Text("Dispatched No:",),
              WidgetUtil.normalVerticalSpace(),
              Text("112",style: TextStyle( fontSize: 28,fontWeight: FontWeight.bold)),
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
      ),
    );
  }
}
