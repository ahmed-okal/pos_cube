import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../core/utils/size_config.dart';

class CustomersTitlesContainer extends StatelessWidget {
  const CustomersTitlesContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width(16),
      ),
      margin: EdgeInsets.symmetric(
        vertical: AppSize.height(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'customer'.tr,
              style: Responsive.isMobile(context)
                  ? AppTextStyle.primary12800
                  : AppTextStyle.primary14800,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'title'.tr,
              style: Responsive.isMobile(context)
                  ? AppTextStyle.primary12800
                  : AppTextStyle.primary14800,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'city'.tr,
              style: Responsive.isMobile(context)
                  ? AppTextStyle.primary12800
                  : AppTextStyle.primary14800,
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              'address'.tr,
              style: Responsive.isMobile(context)
                  ? AppTextStyle.primary12800
                  : AppTextStyle.primary14800,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'balance'.tr,
              style: Responsive.isMobile(context)
                  ? AppTextStyle.primary12800
                  : AppTextStyle.primary14800,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              'contact'.tr,
              style: Responsive.isMobile(context)
                  ? AppTextStyle.primary12800
                  : AppTextStyle.primary14800,
            ),
          ),
        ],
      ),
    );
  }
}
