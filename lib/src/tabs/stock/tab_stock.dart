import 'package:flutter/material.dart';
import 'package:flutter_dio/utils/sliver_grid_delegate_with_fixed_cross_axis_count_and_fixed_height.dart';
import 'package:flutter_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/movie_details_model.dart';
import '../../../res/strings.dart';
import '../../../widgets/custom_appbar.dart';
import 'component/item_stock.dart';

class StockTab extends StatefulWidget {
  const StockTab({super.key});

  @override
  _StockTabState createState() => _StockTabState();
}

class _StockTabState extends State<StockTab> {
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
      title: strings.LABEL_STOCK_TAB,
    );

  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        WidgetUtil.spaceVertical(40),
        GridView.builder(
          shrinkWrap: true,
          primary: false,
          padding: EdgeInsets.only(
              top: 20.w, bottom: 230.h, left: 60.w, right: 60.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: 1,
            crossAxisSpacing: 40.w,
            mainAxisSpacing: 40.w,
            height: 0.23.sh,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ItemStock(index: index);
          },
        ),
      ]),
    );
  }
}
