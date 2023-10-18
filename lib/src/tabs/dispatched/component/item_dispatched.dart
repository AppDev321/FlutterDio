import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/models/product_model.dart';
import 'package:flutter_dio/models/res_dispatch.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/utils/my_application.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_dio/widgets/custom_button.dart';
import 'package:flutter_dio/widgets/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../res/strings.dart';



class ItemDispatched extends StatelessWidget {
  final Dispatch item;


  ItemDispatched({required this.item});

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
              WidgetUtil.normalVerticalSpace(height: 10),

              const  Text("Product Detail",style: TextStyle(fontWeight: FontWeight.bold),),
              WidgetUtil.normalVerticalSpace(height: 5),
              titleDescriptionTextWidget(context,"Id:",item.productId.safeGet()),
              titleDescriptionTextWidget(context,"Sale Price:",item.salePrice.convertedString()),
              titleDescriptionTextWidget(context,"Actual Price:",item.actualPrice.convertedString()),
              titleDescriptionTextWidget(context,"Discount Price:",item.discountedPrice.convertedString()),

              WidgetUtil.normalVerticalSpace(),
              const Text("Dispatched Detail",style: TextStyle(fontWeight: FontWeight.bold),),
              WidgetUtil.normalVerticalSpace(height: 5),
              titleDescriptionTextWidget(context,"From:",item.orgId.safeGet()),
              titleDescriptionTextWidget(context,"To:",item.dispatchToOrganisation.safeGet()),
              titleDescriptionTextWidget(context,"Dispatched Quantity:",item.dispatchedQuantity.convertedString()),


              WidgetUtil.normalVerticalSpace(),
              const Text("Accept Detail",style: TextStyle(fontWeight: FontWeight.bold),),
              WidgetUtil.normalVerticalSpace(height: 5),
              titleDescriptionTextWidget(context,"Accept By:",item.acceptedByName.safeGet()),
              titleDescriptionTextWidget(context,"Accept At:",item.acceptedDate.getCompeteDateTime()),
              titleDescriptionTextWidget(context,"Revised At:",item.revisionDate.getCompeteDateTime()),
              titleDescriptionTextWidget(context,"Accept Quantity:",item.acceptedQuantity.convertedString()),



            ],
          ),
        ),
      ),
    );
  }


  titleDescriptionTextWidget(BuildContext context,String title,String description)
  {
    return  RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
           TextSpan(
            text: title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          TextSpan(
            text: " "+description,
          ),
        ],
      ),
    );
  }

  TextEditingController quantityController = TextEditingController(text: "1");

  void showQuantityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Quantity'),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Enter Dispatched Quantity'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                String enteredQuantity = quantityController.text;
                if (enteredQuantity.isNotEmpty) {
                  // TODO: Add your logic here
                  print('Quantity added: $enteredQuantity');
                }
                Navigator.pop(context);
              },
              child:const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
