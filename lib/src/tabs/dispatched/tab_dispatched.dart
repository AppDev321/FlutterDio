import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/data/common/constants.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_dio/src/widgets/item_home_movie.dart';
import 'package:flutter_dio/utils/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../api/repository/api_repository.dart';
import '../../../models/movie_details_model.dart';
import '../../../res/strings.dart';
import '../../../utils/log_util.dart';
import '../../../utils/my_application.dart';
import '../../../widgets/custom_appbar.dart';
import '../../widgets/item_product.dart';
import 'component/item_dispatched.dart';



class DispatcherTab extends StatefulWidget {
  @override
  _DispatcherTabState createState() => _DispatcherTabState();
}

class _DispatcherTabState extends State<DispatcherTab> {
  bool _isLoadingMovie = false;
  List<MovieDetailsModel> _upcomingMoviesList = [];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return CustomAppBar(
      showLeadingArrow: false,
      centerTitle: false,
      showTitleSpacing: true,
      title: strings.LABEL_DISPATCHED_TAB,
    );
  }

  Widget _buildBody() {
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
                  height: 0.22.sh,
                ),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ItemDispatched(index: index);
                },
              ),

          ),
        ]),

    );
  }

}
