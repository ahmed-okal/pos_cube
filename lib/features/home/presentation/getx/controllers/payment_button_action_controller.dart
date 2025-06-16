import 'package:get/get.dart';
import 'package:point_of_sale/core/routes/app_pages.dart';
import 'package:point_of_sale/core/widgets/failed_snack_bar.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_details_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/orders_list_controller.dart';

class PaymentButtonActionController extends GetxController {
  final OrderController orderController = Get.find<OrderController>();
  final OrdersListController ordersListController =
      Get.find<OrdersListController>();
  final OrderDetailsController orderDetailsController =
      Get.find<OrderDetailsController>();

  Future<void> handlePayment() async {
    final localCart = orderController.localCart;
    final ordersList = ordersListController.ordersListModel.data;
    final currentOrderIndex = ordersListController.order.value;

    // Case 1: If local cart is not empty, fetch order and navigate to payment
    if (localCart.isNotEmpty) {
      List<Future> orderFutures = [];

      for (var item in localCart) {
        final productId = item['productId'] ?? '';
        final productName = item['productName'] ?? '';
        final price = item['price'] ?? '0';
        final qty = int.tryParse(item['qty']!) ?? 1;
        final unitPrice = double.tryParse(price) ?? 0;
        final totalPrice = (unitPrice * qty);

        // If orders list is empty, create new order
        if (ordersList == null || ordersList.isEmpty || currentOrderIndex < 0) {
          failedSnaskBar('ordersListEmpty'.tr);
          return;
        } else {
          // Add to existing order
          orderFutures.add(
            orderController.fetchOrder(
              productId,
              productName,
              qty,
              price,
              totalPrice.toString(),
              ordersList[currentOrderIndex].id ?? 0,
              ordersList[currentOrderIndex].orderNo ?? '',
            ),
          );
        }
      }

      try {
        await Future.wait(orderFutures);
        await ordersListController.getOrdersList();

        // Clear local cart after successful order creation
        orderController.localCart.clear();

        final updatedOrdersList = ordersListController.ordersListModel.data;
        if (updatedOrdersList != null && updatedOrdersList.isNotEmpty) {
          final orderIndex = currentOrderIndex >= 0 &&
                  currentOrderIndex < updatedOrdersList.length
              ? currentOrderIndex
              : updatedOrdersList.length - 1;

          Get.toNamed(
            Routes.paymentView,
            arguments: {
              'orderId': updatedOrdersList[orderIndex].id,
              'orderNumber': updatedOrdersList[orderIndex].orderNo,
              'totalPrice': updatedOrdersList[orderIndex].items?.fold(0,
                      (sum, item) {
                    return sum + (int.tryParse(item.totalPrice ?? '0') ?? 0);
                  }) ??
                  0
            },
          );
        }
      } catch (error) {
        failedSnaskBar('faildToProcessTheOrder'.tr);
      }
    }
    // Case 2: If local cart is empty
    else {
      // Check if orders list and current order exists
      if (ordersList != null &&
          ordersList.isNotEmpty &&
          currentOrderIndex >= 0 &&
          currentOrderIndex < ordersList.length) {
        final currentOrder = ordersList[currentOrderIndex];

        // Check if order items exist and are not empty
        final hasItems =
            currentOrder.items != null && currentOrder.items!.isNotEmpty;
        final totalPrice = hasItems
            ? currentOrder.items!.fold(0, (sum, item) {
                return sum + (int.tryParse(item.totalPrice ?? '0') ?? 0);
              })
            : 0;

        if (!hasItems || totalPrice == 0) {
          failedSnaskBar('noItemsInTheCart'.tr);
          return;
        }

        // ✅ Navigate to payment if items exist and total > 0
        Get.toNamed(
          Routes.paymentView,
          arguments: {
            'orderId': currentOrder.id,
            'orderNumber': currentOrder.orderNo,
            'totalPrice': totalPrice,
          },
        );
      } else {
        failedSnaskBar('noItemsInTheCart'.tr);
      }
    }
  }
}
