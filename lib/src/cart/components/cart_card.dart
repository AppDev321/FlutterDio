import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/res/icons_utils.dart';
import 'package:flutter_dio/res/strings.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/cart_model.dart';
import '../../../utils/my_application.dart';
import '../../../utils/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [

          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: appColor.primaryColor.withOpacity(0.1),
                ),
                child: Image.asset(iconUtils.ic_shoes),
              ),
            ),
          ),
          WidgetUtil.normalHorizontalSpace(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: 200,
                child: AutoSizeText(
                  cartItem.product.category.safeGet(),
                  style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey),
                  maxLines: 1,
                  maxFontSize: 10,
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              WidgetUtil.normalVerticalSpace(height: 3),
              Container(
                width: 200,
                child: AutoSizeText(
                  cartItem.product.name.safeGet(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  maxFontSize: 14,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              WidgetUtil.normalVerticalSpace(height: 3),
              Container(
                width: 200,
                child: AutoSizeText(
                  cartItem.product.orgId.safeGet(),
                  style: const TextStyle(fontWeight: FontWeight.normal,color: Colors.black),
                  maxLines: 1,
                  maxFontSize: 10,
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              WidgetUtil.normalVerticalSpace(height: 5),
              Text.rich(
                TextSpan(
                  text: "\$${cartItem.product.price}",
                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black38),
                  children: [
                    TextSpan(
                        text: " x ${cartItem.numOfItem}",
                        style: const TextStyle(  fontWeight: FontWeight.normal, color: Colors.red)),
                  ],
                ),
              ),
              WidgetUtil.normalVerticalSpace(height: 10),

            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                  vertical: 5
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                      onTap: (){

                        if(cartItem.numOfItem>1) {
                          app.appController.updateCartQuantity(
                              cartItem, cartItem.numOfItem - 1,
                              updateQuantity: true);
                        }
                      },
                      child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),

                            color: Colors.black38,
                          ),
                          child: Icon(Icons.remove, color: Colors.white,size: 60.w,))),
                  WidgetUtil.normalVerticalSpace(height: 10),
                  AutoSizeText(
                    cartItem.numOfItem.convertedString(),
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
                    minFontSize: 10,
                    maxFontSize: 18,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  WidgetUtil.normalVerticalSpace(height: 10),
                  InkWell(
                      onTap:(){
                        app.appController.updateCartQuantity(cartItem,  cartItem.numOfItem+1,updateQuantity: true);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black,
                          ),
                          child: Icon(Icons.add, color: Colors.white,size: 60.w,))),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
