import 'package:flutter/material.dart';
import 'package:flutter_dio/res/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/my_application.dart';
import '../../widgets/custom_progress_view.dart';

// Interface for screen configuration
abstract class BaseScreenInterface {
  dynamic buildAppBar();
  dynamic buildBody();
  dynamic bottomNav();
  dynamic initState();
  int loadingIndex = 0;
}

class BaseScreenWidget extends StatefulWidget {
  final BaseScreenInterface screen;

  BaseScreenWidget({super.key, required this.screen});

  @override
  _BaseScreenWidgetState createState() => _BaseScreenWidgetState();
}

class _BaseScreenWidgetState extends State<BaseScreenWidget> {

  @override
  void initState() {
    widget.screen.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomProgressView(
        isLoading: app.appController.isLoadingIndex(widget.screen.loadingIndex),
        progressIndicator:  SizedBox(
          height: 0.5.sh,
          child: SpinKitWave(color: appColor.whiteshade, size: 70.w),
        ),
        child: Scaffold(
          appBar: widget.screen.buildAppBar(),
          body: widget.screen.buildBody(),
          bottomNavigationBar: widget.screen.bottomNav(),
        ),
      );
    });
  }
}

