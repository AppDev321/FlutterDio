import 'package:flutter/material.dart';
import 'package:flutter_dio/data/common/constants.dart';
import 'package:flutter_dio/src/profile/profile_screen.dart';
import 'package:flutter_dio/src/widgets/item_movie_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../res/app_color.dart';
import '../../../res/strings.dart';
import '../../../utils/log_util.dart';
import '../../../utils/my_application.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_progress_view.dart';


class MoreTab extends StatefulWidget {
  @override
  _MoreTabState createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  @override
  void initState() {
    super.initState();
    app.appController.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomProgressView(
        isLoading: app.appController.isLoadingIndex(2),
        progressIndicator: SpinKitWave(color: appColor.white, size: 80.w),
        child: Scaffold(
          appBar: CustomAppBar(
            showLeadingArrow: false,
            centerTitle: false,
            showTitleSpacing: true,
            title: strings.LABEL_MORE_TAB,
          ),
          body: ProfileScreen(),
        ),
      );
    });
  }

}
