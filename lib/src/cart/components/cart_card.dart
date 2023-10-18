import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/res/icons_utils.dart';
import 'package:flutter_dio/res/strings.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/cart_model.dart';
import '../../../utils/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(),
                child: Image.asset(iconUtils.ic_shoes),
              ),
            ),
          ),
          WidgetUtil.normalHorizontalSpace(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                child: AutoSizeText(
                  cart.product.name.safeGet(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  maxFontSize: 14,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              WidgetUtil.normalVerticalSpace(height: 5),
              Text.rich(
                TextSpan(
                  text: "\$${cart.product.price}",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38),
                  children: [
                    TextSpan(
                        text: " x ${cart.numOfItem}",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.red)),
                  ],
                ),
              ),
              WidgetUtil.normalVerticalSpace(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: (){

                          },
                          child: Icon(Icons.remove, color: Colors.black,size: 50.w,)),
                      WidgetUtil.normalHorizontalSpace(width: 10),
                      Text(
                        "0",
                        style: TextStyle(fontSize: 18.0, color: Colors.grey),
                      ),
                      WidgetUtil.normalHorizontalSpace(width: 10),
                      InkWell(
                          onTap:(){

                          },
                          child: Icon(Icons.add, color: Colors.black,size: 50.w,)),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
