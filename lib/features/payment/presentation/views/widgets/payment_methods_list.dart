// widgets/payment_methods_list.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/payment_controller.dart';

class PaymentMethodsList extends GetView<PaymentController> {
  const PaymentMethodsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Force selection of first payment method when list is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.paymentMethodsController.paymentMethodsModel.isNotEmpty &&
          controller.methodPaidAmounts.isNotEmpty) {
        controller
            .selectMethod(0); // This calls updateMethodPaidAmount internally
      }
    });

    return Obx(
      () => controller.paymentMethodsController.loading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller
                  .paymentMethodsController.paymentMethodsModel.length,
              itemBuilder: (context, index) {
                // if (index == 0 &&
                //     controller.methodPaidAmounts.isNotEmpty &&
                //     controller.payOrderController.money.value == "0.00") {
                //   WidgetsBinding.instance.addPostFrameCallback((_) {
                //     controller.selectMethod(0);
                //   });
                // }
                return PaymentMethodItem(index: index);
              },
            ),
    );
  }
}

class PaymentMethodItem extends GetView<PaymentController> {
  const PaymentMethodItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectMethod(index);
      },
      child: Obx(
        () => Container(
          height: AppSize.height(50),
          margin: EdgeInsets.only(
            bottom: AppSize.height(7),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.width(4),
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.lavenderGray,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(
                  AppSize.height(8),
                ),
                child: Image.asset(
                  AppAssets.errorImage,
                  width: AppSize.width(24),
                ),
              ),
              SizedBox(
                height: AppSize.height(50),
                child: VerticalDivider(
                  color: AppColors.lavenderGray,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Get.locale == const Locale('ar', 'EG')
                          ? (controller
                                  .paymentMethodsController
                                  .paymentMethodsModel[index]
                                  .description
                                  ?.last
                                  .name ??
                              '')
                          : controller
                                  .paymentMethodsController
                                  .paymentMethodsModel[index]
                                  .description
                                  ?.first
                                  .name ??
                              '',
                      style: AppTextStyle.primary18800,
                    ),
                    if (controller.methodPaidAmounts.length > index &&
                        controller.methodPaidAmounts[index] > 0)
                      Text(
                        '${'paidAmount'.tr}: ${controller.methodPaidAmounts[index].toStringAsFixed(2)} ${'SR'.tr}',
                        style: AppTextStyle.green14800,
                      ),
                  ],
                ),
              ),
              Radio<int>(
                activeColor: AppColors.primaryColor,
                value: index,
                groupValue: controller.selectedMethodIndex.value,
                onChanged: (value) => controller.selectMethod(value!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
