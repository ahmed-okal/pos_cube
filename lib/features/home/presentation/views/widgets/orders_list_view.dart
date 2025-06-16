import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/create_new_order_controller.dart';

class OrdersListView extends GetView<CreateNewOrderController> {
  const OrdersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Skeletonizer(
        enabled: controller.ordersListController.loading.isTrue,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          controller: controller.ordersListController.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount:
              controller.ordersListController.ordersListModel.data?.length ?? 0,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: AppSize.width(5),
            );
          },
          itemBuilder: (BuildContext context, int index) {
            GlobalKey itemKey = GlobalKey();
            return InkWell(
              onTap: () {
                controller.ordersListController.order.value = index;
                controller.ordersListController.getOrdersList();
                controller.ordersListController
                    .scrollToSelected(index, itemKey);
                controller.orderController.localCart.clear();
              },
              child: AnimatedContainer(
                key: itemKey,
                duration: const Duration(milliseconds: 300),
                height: AppSize.height(29),
                width: AppSize.width(80),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey1),
                  borderRadius: BorderRadius.circular(6),
                  color: controller.ordersListController.order.value == index
                      ? AppColors.primaryColor
                      : AppColors.white,
                ),
                child: Center(
                  child: Obx(
                    () => Skeletonizer(
                      enabled: controller.ordersListController.loading.isTrue,
                      child: Text(
                        controller.ordersListController.ordersListModel
                                .data?[index].orderNo ??
                            '',
                        style:
                            controller.ordersListController.order.value == index
                                ? AppTextStyle.white14700
                                : AppTextStyle.primary14700,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
