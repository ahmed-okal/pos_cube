import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';
import '../../getx/controllers/order_keyboard_controller.dart';

class OrderKeyBoard extends GetView<CategoriesController> {
  const OrderKeyBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.width(26.1),
        end: AppSize.width(15.1),
        top: controller.orderController.selectedIndex.value == -1
            ? 0
            : AppSize.height(6),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: controller.orderController.selectedIndex.value == -1
            ? AppSize.height(0)
            : AppSize.height(210),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 2.4,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildKey('1', AppColors.white, () {
                    controller.orderKeyboardController.addInput('1');
                  }),
                  _buildKey('2', AppColors.white, () {
                    controller.orderKeyboardController.addInput('2');
                  }),
                  _buildKey('3', AppColors.white, () {
                    controller.orderKeyboardController.addInput('3');
                  }),
                  Obx(
                    () => _buildKey(
                      'qty'.tr,
                      controller.orderKeyboardController.selectedMode.value ==
                              OrderKeyboardMode.qty
                          ? AppColors.frostedMint
                          : AppColors.white,
                      () {
                        controller.orderKeyboardController
                            .selectMode(OrderKeyboardMode.qty);
                      },
                      AppTextStyle.primary18800,
                    ),
                  ),
                  _buildKey('4', AppColors.white, () {
                    controller.orderKeyboardController.addInput('4');
                  }),
                  _buildKey('5', AppColors.white, () {
                    controller.orderKeyboardController.addInput('5');
                  }),
                  _buildKey('6', AppColors.white, () {
                    controller.orderKeyboardController.addInput('6');
                  }),
                  Obx(
                    () => _buildKey(
                      'discount'.tr,
                      controller.orderKeyboardController.selectedMode.value ==
                              OrderKeyboardMode.discount
                          ? AppColors.frostedMint
                          : AppColors.white,
                      () {
                        controller.orderKeyboardController
                            .selectMode(OrderKeyboardMode.discount);
                      },
                      AppTextStyle.primary18800,
                    ),
                  ),
                  _buildKey('7', AppColors.white, () {
                    controller.orderKeyboardController.addInput('7');
                  }),
                  _buildKey('8', AppColors.white, () {
                    controller.orderKeyboardController.addInput('8');
                  }),
                  _buildKey('9', AppColors.white, () {
                    controller.orderKeyboardController.addInput('9');
                  }),
                  Obx(
                    () => _buildKey(
                      'price'.tr,
                      controller.orderKeyboardController.selectedMode.value ==
                              OrderKeyboardMode.price
                          ? AppColors.frostedMint
                          : AppColors.white,
                      () {
                        controller.orderKeyboardController
                            .selectMode(OrderKeyboardMode.price);
                      },
                      AppTextStyle.primary18800,
                    ),
                  ),
                  _buildKey(
                    '+/-',
                    AppColors.yellow,
                    controller.orderKeyboardController.toggleSign,
                  ),
                  _buildKey(
                    '0',
                    AppColors.white,
                    () {
                      controller.orderKeyboardController.addInput('0');
                    },
                  ),
                  _buildKey(
                    '.',
                    AppColors.primaryWithOpacity,
                    () {
                      controller.orderKeyboardController.addInput('.');
                    },
                  ),
                  _buildKey(
                    'X',
                    AppColors.pink,
                    controller.orderKeyboardController.clearInput,
                    AppTextStyle.primary22700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKey(String label,
      [Color? color, VoidCallback? onTap, TextStyle? style]) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(
        horizontal: AppSize.width(3.9),
        vertical: AppSize.height(3.42),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey1),
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: AppColors.primaryWithOpacity,
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: style ?? AppTextStyle.primary22800,
            ),
          ),
        ),
      ),
    );
  }
}
