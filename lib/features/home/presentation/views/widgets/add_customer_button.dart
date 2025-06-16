import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/add_customer_controller.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_dialog_body.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class AddCustomerButton extends GetView<AddCustomerController> {
  const AddCustomerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
        // controller.priceListController.getPriceList();
        // controller.priceListController.customersGroupController
        //     .getCustomersGroup();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              backgroundColor: AppColors.white,
              titlePadding: EdgeInsetsDirectional.only(
                start: AppSize.width(25),
                top: AppSize.height(12),
              ),
              title: Text(
                'addNewCustomer'.tr,
                style: AppTextStyle.primary20800,
              ),
              contentPadding: EdgeInsetsDirectional.only(
                start: AppSize.width(25),
                end: AppSize.width(25),
                top: AppSize.height(8),
              ),
              scrollable: true,
              content: const AddCustomerDialogBody(),
              actions: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: AppSize.height(33),
                    width: AppSize.width(107),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.green),
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
                  onTap: () {
                    if (controller.formKey.currentState?.validate() ?? false) {
                      controller.addCustomer();
                      Get.back();
                    } else {
                      failedSnaskBar('fillTheRequiredFields'.tr);
                    }
                  },
                  child: Container(
                    height: AppSize.height(33),
                    width: AppSize.width(107),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      border: Border.all(color: AppColors.green),
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
          },
        );
      },
      child: Container(
        height: AppSize.height(36),
        width: AppSize.width(125),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            'addCustomer'.tr,
            style: AppTextStyle.white14800,
          ),
        ),
      ),
    );
  }
}
