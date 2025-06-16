import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/categories_controller.dart';

enum OrderKeyboardMode { none, qty, discount, price }

class OrderKeyboardController extends GetxController {
  // Holds the current numeric input as a string.
  var currentInput = ''.obs;
  // The currently selected mode.
  var selectedMode = OrderKeyboardMode.none.obs;

  // Called when a special key (Qty, % Discount, or Price) is pressed.
  void selectMode(OrderKeyboardMode mode) {
    selectedMode.value = mode;
    currentInput.value = ''; // reset input when changing mode
  }

  // Called when a numeric or dot key is pressed.
  void addInput(String value) {
    currentInput.value += value;
    _applyInput();
  }

  // Toggle the sign of the current input.
  void toggleSign() {
    if (currentInput.value.startsWith('-')) {
      currentInput.value = currentInput.value.substring(1);
    } else {
      currentInput.value = '-${currentInput.value}';
    }
    _applyInput();
  }

  // Clear the current input.
  void clearInput() {
    currentInput.value = '';
    _applyInput();
  }

  // Apply the current input to the selected order item.
  void _applyInput() {
    // Access the CategoriesController (which holds the orderController)
    final categoriesController = Get.find<CategoriesController>();
    final orderController = categoriesController.orderController;
    final selectedIndex = orderController.selectedIndex.value;

    // Ensure there is a selected item.
    if (selectedIndex == -1) return;

    // Example: if using a local cart to store order items.
    if (orderController.localCart.isNotEmpty) {
      var currentItem = orderController.localCart[selectedIndex];
      switch (selectedMode.value) {
        case OrderKeyboardMode.qty:
          currentItem['qty'] = currentInput.value;
          break;
        case OrderKeyboardMode.discount:
          // Assuming you have a 'discount' field.
          currentItem['discount'] = currentInput.value;
          break;
        case OrderKeyboardMode.price:
          currentItem['price'] = currentInput.value;
          break;
        case OrderKeyboardMode.none:
          break;
      }
      orderController.localCart[selectedIndex] = currentItem;
      orderController.localCart.refresh();
    } else {
      // Optionally, update an order item from your orders list.
      // e.g., categoriesController.orderController.updateItemField(selectedIndex, selectedMode.value, currentInput.value);
    }
  }
}
