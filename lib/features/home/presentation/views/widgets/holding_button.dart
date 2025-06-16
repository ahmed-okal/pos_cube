import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/holding_controller.dart';

class HoldingButton extends GetView<HoldingController> {
  const HoldingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => controller.handleHolding(),
        child: Container(
          // width: AppSize.width(60),
          height: AppSize.height(33),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.secondry,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              'holding'.tr,
              style: AppTextStyle.primary18800,
            ),
          ),
        ),
      ),
    );
  }
}
