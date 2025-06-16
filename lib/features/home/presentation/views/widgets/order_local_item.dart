import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/core/utils/size_utils.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';

class OrderLocaleItem extends GetView<CategoriesController> {
  const OrderLocaleItem({
    required this.productName,
    required this.qty,
    required this.price,
    required this.totalPrice,
    required this.itemId,
    required this.productCode,
    required this.index,
    super.key,
  });

  final String productName;
  final String qty;
  final String itemId, price;
  final String totalPrice;
  final String productCode;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          controller.orderController.toggleSelection(index);
        },
        child: AnimatedContainer(
          height: AppSize.height(44),
          width: double.infinity,
          key: ValueKey(controller.orderController.orderModel.data?.id ?? 0),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
              color: controller.orderController.selectedIndex.value == index
                  ? AppColors.lightGreen
                  : AppColors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(11),
              vertical: AppSize.height(3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productName,
                              style: AppTextStyle.primary12800,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.third,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSize.width(5),
                                      ),
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        qty,
                                        style: AppTextStyle.primary10700,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  ' X ',
                                  style: AppTextStyle.primary10700,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '$price ',
                                  style: AppTextStyle.primary10700,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'SR'.tr,
                                  style: AppTextStyle.primary10700,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '/',
                                  style: AppTextStyle.primary10700,
                                ),
                                Text(
                                  'meal'.tr,
                                  style: AppTextStyle.primary10700,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // Text(
                                //   productCode,
                                //   style: AppTextStyle.primary10700,
                                //   overflow: TextOverflow.ellipsis,
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '$totalPrice ',
                            style: AppTextStyle.primary12800,
                          ),
                          Text(
                            'SR'.tr,
                            style: AppTextStyle.primary12800,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: AppSize.width(5),
                      ),
                      InkWell(
                        onTap: () {
                          controller.orderController.localCart.removeWhere(
                              (item) =>
                                  item['productId'].toString() ==
                                  itemId.toString());
                        },
                        child: Container(
                          height: AppSize.height(16),
                          width: AppSize.height(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryWithOpacity,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close,
                              size: getSize(12),
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
