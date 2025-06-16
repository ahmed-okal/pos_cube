import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/features/print/presentation/getx/controllers/print_controller.dart';

import '../../../../../core/utils/size_config.dart';

class NewOrderButton extends GetView<PrintController> {
  const NewOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final ordersListController =
            controller.createNewOrderController.ordersListController;
        if (ordersListController.scrollController.hasClients) {
          ordersListController.scrollController.dispose();
          ordersListController.scrollController = ScrollController();
        }
        controller.createNewOrderController.setOrderType(0);
        controller.createNewOrderController.getCreateNewOrder();
        controller.createNewOrderController.orderController.localCart.clear();
        Get.back();
        Get.back();
      },
      child: Container(
        height: AppSize.height(39),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.grey2,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            'newOrder'.tr,
            style: AppTextStyle.primary18800,
          ),
        ),
      ),
    );
  }
}
