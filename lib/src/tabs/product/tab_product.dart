import 'package:flutter/material.dart';
import 'package:flutter_dio/src/cart/cart_screen.dart';
import 'package:flutter_dio/src/tabs/product/add_product_screen.dart';
import 'package:flutter_dio/utils/size_config.dart';
import 'package:flutter_dio/utils/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../models/movie_details_model.dart';
import '../../../res/app_color.dart';
import '../../../res/strings.dart';
import '../../../utils/my_application.dart';
import '../../../widgets/custom_appbar.dart';
import '../../widgets/item_bottom_bar.dart';
import '../base_screen_widget.dart';
import 'component/item_product.dart';


class ProductTab extends StatelessWidget implements BaseScreenInterface {

  @override
  int loadingIndex = 0;

  @override
  initState() {


  }
  @override
  bottomNav() {
  }

  @override
  Widget build(BuildContext context) {
  return BaseScreenWidget(screen: this);
  }


  @override
  buildAppBar() {
    return CustomAppBar(
      showLeadingArrow: false,
      centerTitle: false,
      showTitleSpacing: true,
      title: strings.LABEL_PRODUCTS_TAB,
      actionsWidget: [

        GestureDetector(
          onTap: (){
            Get.to(()=>AddProductScreen());
          },
          child: Padding(
            padding:  const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_outlined ),
                  Text(strings.LABEL_ADD_PRODUCT,style:const TextStyle(fontSize: 10),),
                ]
            ),
          ),
        ),
        Center(
          child: ItemBottomBar(
            icon: Icons.shopping_cart_outlined,
          showBadge: true,
            badgeValue: app.appController.cartList.length,
            onPressed: () {
             if( app.appController.cartList.isNotEmpty)
               {
                 app.navigationTransitionScreen(const CartScreen());
               }
            },
          ),
        ),
      ],
    );
  }

  @override
  buildBody() {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
        WidgetUtil.spaceVertical(40),

      app.appController.productList.isNotEmpty ?
          GridView.builder(
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.only(
              top: 20.w, bottom: 230.h, left: 60.w, right: 60.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 2,
            crossAxisSpacing: 40.w,
            mainAxisSpacing: 40.w,
            height: 0.34.sh,
          ),
          itemCount: app.appController.productList.length,
          itemBuilder: (context, index) {
            final data = app.appController.productList[index];
            return ItemProduct( item: data);
          },
        ):    WidgetUtil.displayErrorView()


      ]),
    );
  }



}
