import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/payment_controller.dart';

class SelectedMethodAmountWidget extends GetView<PaymentController> {
  const SelectedMethodAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.green.withAlpha(100), width: 1.5),
        color: AppColors.white,
      ),
      height: AppSize.height(55),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width(16),
        vertical: AppSize.height(9),
      ),
      child: Row(
        children: [
          Obx(
            () => _buildMethodName(),
          ),
          const Spacer(),
          Obx(
            () => Text(
              controller.payOrderController.money.value,
              style: AppTextStyle.darkgreen20800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodName() {
    if (controller.selectedMethodIndex.value < 0 ||
        controller.paymentMethodsController.paymentMethodsModel.isEmpty ||
        controller.selectedMethodIndex.value >=
            controller.paymentMethodsController.paymentMethodsModel.length) {
      return Text(
        'noPaymentMethodSelected'.tr,
        style: AppTextStyle.darkgreen20800,
      );
    }
    final paymentMethod = controller.paymentMethodsController
        .paymentMethodsModel[controller.selectedMethodIndex.value];
    return Text(
      Get.locale == const Locale('ar', 'EG')
          ? (paymentMethod.description?.last.name ?? '')
          : (paymentMethod.description?.first.name ?? ''),
      style: AppTextStyle.darkgreen20800,
    );
  }
}
