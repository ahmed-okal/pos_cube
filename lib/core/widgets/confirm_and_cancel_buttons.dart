import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
import '../utils/size_config.dart';

class ConfirmAndCancelButtons extends StatelessWidget {
  const ConfirmAndCancelButtons({
    super.key,
    required this.confirmTap,
    required this.cancelTap,
  });

  final void Function()? confirmTap;
  final void Function()? cancelTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: AppSize.width(7),
      children: [
        InkWell(
          onTap: cancelTap,
          child: Container(
            height: AppSize.height(33),
            width: AppSize.width(107),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                width: 1.5,
                color: AppColors.green,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                'discard'.tr,
                style: AppTextStyle.green14800,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: confirmTap,
          child: Container(
            height: AppSize.height(33),
            width: AppSize.width(107),
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                'confirm'.tr,
                style: AppTextStyle.white14800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
