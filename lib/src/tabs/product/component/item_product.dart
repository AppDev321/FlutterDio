import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/models/res_product.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/res/icons_utils.dart';
import 'package:flutter_dio/res/strings.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_dio/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/my_application.dart';
import '../../../../utils/size_config.dart';
import '../../../../widgets/colored_label.dart';
import '../../../cart/cart_screen.dart';



class ItemProduct extends StatelessWidget {
  final Product item;


  ItemProduct({required this.item});

  @override
  Widget build(BuildContext context) {
      return Stack(
        children:[
          Card(
            elevation: 5,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Expanded(
                child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    child: AspectRatio(
                      aspectRatio: 0.88,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(iconUtils.ic_shoes),
                      ),
                    ),
                  ),
                  WidgetUtil.normalHorizontalSpace(width: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: AutoSizeText(
                            item.category.safeGet(),
                            style: const TextStyle(color: Colors.black26),
                            maxLines: 1,
                            maxFontSize: 12,
                            overflow: TextOverflow.ellipsis,

                          ),
                        ),
                        WidgetUtil.normalVerticalSpace(height: 5),
                        SizedBox(
                          width: 200,
                          child: AutoSizeText(
                          item.name.safeGet(),
                            style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),
                            maxLines: 1,
                            maxFontSize: 14,
                            minFontSize: 12,
                            overflow: TextOverflow.ellipsis,

                          ),
                        ),
                        WidgetUtil.normalVerticalSpace(height: 5),
                        Text(item.isActive ==true? "Active":"Not Available",textAlign: TextAlign.center,style:TextStyle(fontSize: 35.sp,color: item.isActive ==true? Colors.green:Colors.red) ,),
                        WidgetUtil.normalVerticalSpace(height: 5),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: "Qty : ",
                                style:  TextStyle(fontSize: 35.sp,),
                              ),
                              TextSpan(
                                text:"${item.availableQuantity}",
                                style:   TextStyle(  fontSize: 35.sp,),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
                 ),
              ),
              Row(

                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20.w),
                      alignment: Alignment.centerLeft,
                      child: Text("\$${item.price}",
                          style: TextStyle(
                              color: appColor.main,
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      app.navigationTransitionScreen(CartScreen());
                    },
                    elevation: 0,
                    minWidth: 0,
                    color: appColor.main,
                    padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 40.w),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(10))),
                    child: Icon(Icons.shopping_cart_outlined, size: 45.w, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),

        ]);

  }

  TextEditingController quantityController = TextEditingController(text: "1");

  void showQuantityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quantity'),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter quantity'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
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
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
