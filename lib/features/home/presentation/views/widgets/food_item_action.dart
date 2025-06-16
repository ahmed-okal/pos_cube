import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/controllers/categories_controller.dart';
import 'food_item_widget.dart';

class FoodItemAction extends GetView<CategoriesController> {
  const FoodItemAction({
    super.key,
    required this.productId,
    required this.productName,
    required this.price,
    required this.product,
    required this.image,
    required this.totalPrice,
  });

  final String product, image, productId, productName, price, totalPrice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bool itemFound = false;

        for (var i = 0; i < controller.orderController.localCart.length; i++) {
          var item = controller.orderController.localCart[i];
          if (item['productId'] == productId) {
            int currentQty = int.tryParse(item['qty'] ?? '1') ?? 1;
            currentQty++;
            // Update the quantity.
            controller.orderController.localCart[i]['qty'] =
                currentQty.toString();
            itemFound = true;
            break;
          }
        }

        if (!itemFound) {
          final foodItem = {
            'productId': productId,
            'productName': productName,
            'price': price,
            'totalPrice': totalPrice,
            'product': product,
            'image': image,
            'qty': '1',
          };
          controller.orderController.localCart.add(foodItem);
        }

        // Refresh the RxList to notify GetX of the changes.
        controller.orderController.localCart.refresh();
        // controller.orderController.selectedQuantity.value = 1;
        // controller.ordersListController.getOrdersList();
      },
      child: FoodItemWidget(image: image, product: product),
    );
  }
}
