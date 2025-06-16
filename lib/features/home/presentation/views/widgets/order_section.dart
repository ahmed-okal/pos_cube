import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/order_keyboard.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/orders_number_section.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';
import 'order_actions_buttons.dart';
import 'order_items_list_view.dart';
import 'order_payment_buttons.dart';
import 'order_total_price.dart';

class OrderSection extends GetView<CategoriesController> {
  const OrderSection({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.greenWithOpacity,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrdersNumberSection(),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: AppSize.width(30),
                  end: AppSize.width(19),
                ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: controller.orderController.selectedIndex.value == -1
                      ? AppSize.height(460)
                      : AppSize.height(270),
                  width: AppSize.width(397),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.primaryWithOpacity,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Obx(
                        () => Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: AppSize.height(12),
                                ),
                                child: controller.ordersListController
                                            .ordersListModel.data?.isEmpty ==
                                        true
                                    ? Center(
                                        child: Text(
                                          'noOrders'.tr,
                                          style: AppTextStyle.primary18600,
                                        ),
                                      )
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'orderNumber'.tr,
                                            style: AppTextStyle.primary18600,
                                          ),
                                          SizedBox(width: AppSize.width(4)),
                                          Text(
                                            '${controller.ordersListController.ordersListModel.data?[controller.ordersListController.order.value].orderNo ?? ''}#'
                                                .tr,
                                            style: AppTextStyle.primary18800,
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            controller.createNewOrderController.orderType
                                        .value ==
                                    -1
                                ? const SizedBox()
                                : Container(
                                    height: AppSize.height(31),
                                    width: AppSize.width(77),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryWithOpacity3,
                                      borderRadius:
                                          const BorderRadiusDirectional.only(
                                        topStart: Radius.circular(10),
                                        bottomEnd: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.createNewOrderController
                                                    .orderType.value ==
                                                0
                                            ? 'takeAway'.tr
                                            : 'dineIn'.tr,
                                        style: AppTextStyle.primary12800,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Obx(
                        () => controller.tablesController.selectedTable.value ==
                                -1
                            ? SizedBox()
                            : Container(
                                height: AppSize.height(26.5),
                                width: AppSize.width(130),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'tableNumber'.tr,
                                      style: AppTextStyle.primary14600,
                                    ),
                                    Text(
                                      ' ${controller.tablesController.tablesModel.data?[controller.tablesController.selectTablesPlase.value].tables?[controller.tablesController.selectedTable.value].tableCode}#',
                                      style: AppTextStyle.primary14800,
                                    ),
                                  ],
                                ),
                              ),
                      ),
                      SizedBox(
                        height: AppSize.height(8),
                      ),
                      const OrdersItemListView(),
                      const Divider(
                        height: 0,
                        color: AppColors.primaryWithOpacity2,
                      ),
                      SizedBox(
                        height: AppSize.height(57),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSize.height(5),
                            horizontal: AppSize.width(19),
                          ),
                          child: const OrderTotalPrice(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.height(19),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: AppSize.width(30),
                  end: AppSize.width(19),
                ),
                child: const OrderActionsButton(),
              ),
              OrderKeyBoard(),
              SizedBox(
                height: AppSize.height(8),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: AppSize.width(30),
                  end: AppSize.width(19),
                ),
                child: const OrderPaymentButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
