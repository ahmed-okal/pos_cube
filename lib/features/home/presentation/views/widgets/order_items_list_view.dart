import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/order_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';
import 'order_local_item.dart';

class OrdersItemListView extends GetView<CategoriesController> {
  const OrdersItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          final dataList = controller.ordersListController.ordersListModel.data;
          final localCart = controller.orderController.localCart;
          final currentOrderIndex = controller.ordersListController.order.value;
          if (localCart.isEmpty && dataList != null && dataList.isNotEmpty) {
            return Skeletonizer(
              enabled: controller.ordersListController.loading.isTrue ||
                  controller.deleteItemController.loading.isTrue,
              child: ListView.separated(
                itemCount: dataList[currentOrderIndex].items?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = dataList[currentOrderIndex].items?[index];
                  return OrderItem(
                    productName: item?.productName ?? '',
                    qty: item?.qty ?? '',
                    price: item?.price ?? '',
                    totalPrice: item?.totalPrice ?? '',
                    itemId: item?.id ?? -1,
                    index: index,
                    productCode: item?.productId ?? '',
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: AppSize.width(8),
                    endIndent: AppSize.width(8),
                    height: 0,
                  );
                },
              ),
            );
          } else if (localCart.isNotEmpty) {
            return ListView.separated(
              itemCount: localCart.length,
              separatorBuilder: (context, index) {
                return Divider(
                  indent: AppSize.width(8),
                  endIndent: AppSize.width(8),
                  height: 0,
                );
              },
              itemBuilder: (context, index) {
                final item = localCart[index];
                return OrderLocaleItem(
                  productName: item['productName'] ?? '',
                  qty: item['qty'] ?? '',
                  price: item['price'] ?? '',
                  totalPrice: (() {
                    final qty = int.tryParse(item['qty'] ?? '1') ?? 1;
                    final unitPrice =
                        double.tryParse(item['price'] ?? '0') ?? 0;
                    return (unitPrice * qty).toString();
                  })(),
                  itemId: item['productId'] ?? '',
                  index: index,
                  productCode: item['producId'] ?? '',
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'empty'.tr,
                style: AppTextStyle.lavenderGray32600,
              ),
            );
          }
        },
      ),
    );
  }
}
