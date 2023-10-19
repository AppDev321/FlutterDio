import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';

import '../../models/cart_model.dart';
import '../../res/icons_utils.dart';
import '../../utils/my_application.dart';
import '../../utils/size_config.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var cartList = app.appController.cartList;

      return Scaffold(
        appBar: buildAppBar(context,cartList),
        body:
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: cartList.isNotEmpty?
          ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) => Padding(
              padding:const EdgeInsets.symmetric(vertical: 10),
              child: Dismissible(
                key: Key(cartList[index].product.productId.toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    var item = cartList[index];
                    app.appController.deleteCartItem(item);

                  });
                },
                background: Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: appColor.blackshade,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        iconUtils.ic_delete,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                child: CartCard(cartItem: cartList[index]),
              ),
            ),
          ):
          WidgetUtil.displayErrorView(),
        ),
        bottomNavigationBar:const CheckoutCard(),
      );
    });
  }

  AppBar buildAppBar(BuildContext context,List<CartItem> cartList) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Text(
            "Your Cart",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "${cartList.length} items",
            style: TextStyle(color: Colors.white, fontSize: 32.w),
          ),
        ],
      ),
    );
  }



}
