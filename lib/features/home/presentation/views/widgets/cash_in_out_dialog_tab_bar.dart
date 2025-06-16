import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';

class CashInOutDialogTabBar extends GetView<CategoriesController> {
  const CashInOutDialogTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () {
            final isSelected =
                (controller.cashInOutController.selectedTabIndex.value == 0);
            return InkWell(
              onTap: () => controller.cashInOutController.onTabChanged(0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: AppSize.height(33),
                width: AppSize.width(107),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    width: 1.5,
                    color: AppColors.primaryColor,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'cashIn'.tr,
                  style: isSelected
                      ? AppTextStyle.white16800
                      : AppTextStyle.primary16800,
                ),
              ),
            );
          },
        ),
        SizedBox(
          width: AppSize.width(7),
        ),
        Obx(
          () {
            final isSelected =
                (controller.cashInOutController.selectedTabIndex.value == 1);
            return InkWell(
              onTap: () => controller.cashInOutController.onTabChanged(1),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: AppSize.height(33),
                width: AppSize.width(107),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    width: 1.5,
                    color: AppColors.primaryColor,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'cashOut'.tr,
                  style: isSelected
                      ? AppTextStyle.white16800
                      : AppTextStyle.primary16800,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
