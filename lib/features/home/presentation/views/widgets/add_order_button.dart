import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/core/widgets/failed_snack_bar.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/tables_right_side.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../../../../core/widgets/confirm_and_cancel_buttons.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../getx/controllers/create_new_order_controller.dart';

class AddOrderButton extends GetView<CreateNewOrderController> {
  const AddOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.getCreateNewOrder();
        // controller.ordersListController.getOrdersList();
        // controller.orderController.localCart.clear();
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return ChooseOrderTypeDialog();
          },
        );
      },
      child: Container(
        height: AppSize.height(29),
        width: AppSize.width(157),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.green,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline_outlined,
              color: AppColors.white,
              size: getSize(19),
            ),
            SizedBox(width: AppSize.width(4)),
            Text(
              'newOrder'.tr,
              style: AppTextStyle.white16800,
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseOrderTypeDialog extends GetView<CreateNewOrderController> {
  const ChooseOrderTypeDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      backgroundColor: AppColors.white,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSize.height(0),
        horizontal: AppSize.width(0),
      ),
      content: ChooseOrderTypeDialogBody(),
    );
  }
}

class ChooseOrderTypeDialogBody extends GetView<CreateNewOrderController> {
  const ChooseOrderTypeDialogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(335),
      width: AppSize.width(725),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSize.height(16),
          horizontal: AppSize.width(20),
        ),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'orderType'.tr,
                style: AppTextStyle.primary16800,
              ),
            ),
            SizedBox(
              height: AppSize.height(28),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSize.width(12),
              children: [
                InkWell(
                  onTap: () {
                    controller.setOrderType(0);
                  },
                  child: Obx(
                    () => Container(
                      height: AppSize.height(129),
                      width: AppSize.width(107),
                      decoration: BoxDecoration(
                        color: controller.orderType.value == 0
                            ? AppColors.primaryColor
                            : AppColors.white,
                        border: Border.all(
                          width: 1.5,
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'takeAway'.tr,
                          style: controller.orderType.value == 0
                              ? AppTextStyle.white14800
                              : AppTextStyle.primary14800,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.setOrderType(1);
                  },
                  child: Obx(
                    () => Container(
                      height: AppSize.height(129),
                      width: AppSize.width(107),
                      decoration: BoxDecoration(
                        color: controller.orderType.value == 1
                            ? AppColors.primaryColor
                            : AppColors.white,
                        border: Border.all(
                          width: 1.5,
                          color: AppColors.primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          'dineIn'.tr,
                          style: controller.orderType.value == 1
                              ? AppTextStyle.white14800
                              : AppTextStyle.primary14800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            ConfirmAndCancelButtons(
              cancelTap: () {
                controller.setOrderType(-1);
                Get.back();
              },
              confirmTap: () {
                Get.back();

                if (controller.orderType.value == 0) {
                  controller.getCreateNewOrder();
                } else if (controller.orderType.value == 1) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ChooseTableDialog();
                    },
                  );
                } else {
                  failedSnaskBar('chooseOrderType'.tr);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseTableDialog extends GetView<CreateNewOrderController> {
  const ChooseTableDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.tablesController.loading.isTrue
          ? const LoadingWidget()
          : AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              // contentPadding: EdgeInsets.zero,
              title: Center(
                child: Text(
                  'tables'.tr,
                  style: AppTextStyle.primary20800,
                ),
              ),
              backgroundColor: AppColors.white,
              content: SizedBox(
                height: AppSize.height(672),
                width: AppSize.width(725),
                child: Column(
                  children: [
                    TablesRightSide(
                      margin: EdgeInsets.all(0),
                    ),
                    ConfirmAndCancelButtons(
                      cancelTap: () {
                        Get.back();
                      },
                      confirmTap: () {
                        Get.back();
                        controller.getCreateNewOrder();
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
