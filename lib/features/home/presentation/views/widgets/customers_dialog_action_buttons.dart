import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/customers_controller.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/utils/size_utils.dart';

class CustomersDialogActionButtons extends GetView<CustomersController> {
  const CustomersDialogActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: controller.selectedCustomerId.value == null
            ? 0
            : AppSize.height(27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: AppSize.height(27),
                width: AppSize.width(75),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppColors.primaryColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'edit'.tr,
                      style: AppTextStyle.primary14700,
                    ),
                    SizedBox(width: AppSize.width(4)),
                    Icon(
                      Icons.edit,
                      size: controller.selectedCustomerId.value == null
                          ? 0
                          : getSize(14),
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: AppSize.width(7),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: AppSize.height(27),
                width: AppSize.width(75),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: AppColors.red,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'delete'.tr,
                      style: AppTextStyle.red14700,
                    ),
                    SizedBox(
                      width: AppSize.width(4),
                    ),
                    Icon(
                      Icons.delete,
                      size: controller.selectedCustomerId.value == null
                          ? 0
                          : getSize(14),
                      color: AppColors.red,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
