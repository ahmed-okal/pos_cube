import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/failed_snack_bar.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/orders_list_controller.dart';

import '../../../../auth/login/presentation/getx/controllers/login_controller.dart';

class HoldingController extends GetxController {
  final OrderController orderController = Get.find<OrderController>();
  final OrdersListController ordersListController =
      Get.find<OrdersListController>();
  final LoginController loginController = Get.find<LoginController>();
  Future<void> handleHolding() async {
    final ordersList = ordersListController.ordersListModel.data;
    final currentOrderIndex = ordersListController.order.value;

    if (ordersList == null || ordersList.isEmpty) {
      final localCart = orderController.localCart;
      if (localCart.isEmpty) {
        failedSnaskBar('ordersListEmpty'.tr);
        return;
      }

      // Handle new order creation
      List<Future> orderFutures = [];

      for (var item in localCart) {
        final productId = item['productId'] ?? '';
        final productName = item['productName'] ?? '';
        final price = item['price'] ?? '0';
        final qty = int.tryParse(item['qty'] ?? '1') ?? 1;
        final unitPrice = double.tryParse(price) ?? 0;
        final totalPrice = (unitPrice * qty).toString();

        // For new orders, we'll use default values for orderId and orderNo
        orderFutures.add(orderController.fetchOrder(
          productId,
          productName,
          qty,
          price,
          totalPrice,
          ordersList?[currentOrderIndex].id ?? 0,
          ordersList?[currentOrderIndex].orderNo ?? '',
        ));
      }

      try {
        await Future.wait(orderFutures);
        await ordersListController.getOrdersList();

        // Clear local cart after successful order creation
        orderController.localCart.clear();
      } catch (error) {
        failedSnaskBar('faildToProcessTheOrder'.tr);
      }
    } else {
      final localCart = orderController.localCart;
      if (localCart.isEmpty) {
        failedSnaskBar('noItemsInTheCart'.tr);
        return;
      }

      for (var item in localCart) {
        final productId = item['productId'] ?? '';
        final productName = item['productName'] ?? '';
        final price = item['price'] ?? '0';
        final qty = int.tryParse(item['qty'] ?? '1') ?? 1;
        final unitPrice = double.tryParse(price) ?? 0;
        final totalPrice = (unitPrice * qty) +
            (unitPrice * qty) *
                num.parse(loginController.loginTaskModel.data?.company?[0]
                        .settings?.invoice?[14].value ??
                    '0') /
                100;

        await orderController.fetchOrder(
          productId,
          productName,
          qty,
          price,
          totalPrice.toString(),
          ordersListController
                  .ordersListModel.data?[ordersListController.order.value].id ??
              0,
          ordersListController.ordersListModel
                  .data?[ordersListController.order.value].orderNo ??
              '',
        );
      }

      await ordersListController.getOrdersList();

      // Clear local cart after successful order creation
      orderController.localCart.clear();
    }
  }
}
