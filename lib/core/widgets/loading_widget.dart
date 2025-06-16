import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_assets.dart';
import '../utils/app_text_style.dart';
import '../utils/size_config.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            AppAssets.loadingAnimation,
            height: AppSize.height(75),
          ),
          SizedBox(height: AppSize.height(10)),
          Text(
            'loading'.tr,
            textAlign: TextAlign.center,
            style: AppTextStyle.green20700,
          )
        ],
      ),
    );
  }
}
