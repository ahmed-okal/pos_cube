import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../getx/controllers/categories_controller.dart';

class OrderTotalPrice extends GetView<CategoriesController> {
  const OrderTotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'total'.tr,
          style: AppTextStyle.primary18800,
        ),
        Obx(
          () {
            if (controller.ordersListController.loading.isTrue) {
              return Skeletonizer(
                enabled: true,
                child: Text(
                  'sr'.trArgs(['0']),
                  style: AppTextStyle.primary18800,
                ),
              );
            }
            int total = 0;
            if (controller.ordersListController.ordersListModel.data != null &&
                controller
                    .ordersListController.ordersListModel.data!.isNotEmpty &&
                controller.ordersListController.order.value <
                    controller
                        .ordersListController.ordersListModel.data!.length) {
              total = controller.ordersListController.ordersListModel
                      .data![controller.ordersListController.order.value].items
                      ?.fold(0, (sum, item) {
                    return sum! + (int.tryParse(item.totalPrice ?? '0') ?? 0);
                  }) ??
                  0;
            }
            double localeTotal =
                controller.orderController.localCart.fold(0, (prev, item) {
              int qty = int.tryParse(item['qty'] ?? '1') ?? 1;
              double unitPrice = double.tryParse(item['price'] ?? '0') ?? 0;
              return prev + (qty * unitPrice);
            });
            return Row(
              children: [
                Text(
                  '${localeTotal != 0 ? localeTotal.toString() : total == 0 ? '' : total.toString()} ',
                  style: AppTextStyle.primary18800,
                ),
                Text(
                  'SR'.tr,
                  style: AppTextStyle.primary18800,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
