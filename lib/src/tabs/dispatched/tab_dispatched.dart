import 'package:flutter/material.dart';
import 'package:flutter_dio/src/tabs/base_screen_widget.dart';
import 'package:flutter_dio/utils/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/movie_details_model.dart';
import '../../../res/strings.dart';
import '../../../utils/my_application.dart';
import '../../../widgets/custom_appbar.dart';
import 'component/item_dispatched.dart';



class DispatcherTab extends StatelessWidget implements BaseScreenInterface {

  @override
  int loadingIndex = 0;


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
      title: strings.LABEL_DISPATCHED_TAB,
    );
  }

  @override
  buildBody() {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetUtil.spaceVertical(40),
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.only(
                    top: 20.w, bottom: 230.h, left: 60.w, right: 60.w),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                  crossAxisCount: 1,
                  crossAxisSpacing: 40.w,
                  mainAxisSpacing: 40.w,
                  height: 0.42.sh,
                ),
                itemCount: app.appController.dispatchList.length,
                itemBuilder: (context, index) {
                  var dispatchedItem =  app.appController.dispatchList[index];
                  return ItemDispatched(item: dispatchedItem);
                },
              ),

            ),
          ]),

    );
  }



}
