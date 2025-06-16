import 'package:get/get.dart';
import 'package:point_of_sale/core/routes/app_pages.dart';
import 'package:point_of_sale/features/auth/login/presentation/getx/controllers/login_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/orders_list_controller.dart';
import 'package:point_of_sale/features/payment/presentation/getx/controllers/pay_order_controller.dart';
import 'package:point_of_sale/features/payment/presentation/getx/controllers/payment_methods_controller.dart';

import '../../../../../core/widgets/failed_snack_bar.dart';

class PaymentController extends GetxController {
  final OrdersListController ordersListController =
      Get.find<OrdersListController>();
  final LoginController loginController = Get.find<LoginController>();
  final int orderId = Get.arguments?['orderId'] ?? 0;
  final int orderNumber =
      int.tryParse(Get.arguments?['orderNumber'].toString() ?? '0') ?? 0;
  final num totalPrice = Get.arguments?['totalPrice'] ?? 0;
  final PaymentMethodsController paymentMethodsController =
      Get.find<PaymentMethodsController>();
  final PayOrderController payOrderController = Get.find<PayOrderController>();
  var selectedMethodIndex = (-1).obs;
  var methodPaidAmounts = <double>[].obs;
  // Make this reactive
  // final Rx<String> _shouldPaidAmount = '0.0'.obs;

  // String get shouldPaidAmount {
  //   _calculateShouldPaidAmount();
  //   return _shouldPaidAmount.value;
  // }

  // void _calculateShouldPaidAmount() {
  //
  //   totalPrice.toStringAsFixed(2) =
  //
  // }
  String get shouldPaidAmount {
    final vatPercentage = num.parse(loginController
            .loginTaskModel.data?.company?[0].settings?.invoice?[14].value ??
        '0');
    double total = (totalPrice + (totalPrice * vatPercentage / 100));
    return total.toStringAsFixed(2);
  }

  double get remaining {
    totalPrice;
    final vatPercentage = num.parse(loginController
            .loginTaskModel.data?.company?[0].settings?.invoice?[14].value ??
        '0');
    double total = (totalPrice + (totalPrice * vatPercentage / 100));

    double paid = methodPaidAmounts.fold(0.0, (sum, amount) => sum + amount);

    return total - paid;
  }

  void selectMethod(int index) {
    if (methodPaidAmounts.isEmpty ||
        paymentMethodsController.paymentMethodsModel.isNotEmpty) {
      methodPaidAmounts.value = List<double>.filled(
        paymentMethodsController.paymentMethodsModel.length,
        0.0,
      );
    }
    if (selectedMethodIndex.value >= 0) {
      final updatedAmounts = List<double>.from(methodPaidAmounts);
      updatedAmounts[selectedMethodIndex.value] =
          double.tryParse(payOrderController.money.value) ?? 0.0;
      methodPaidAmounts.value = updatedAmounts;
    }
    selectedMethodIndex.value = index;
    payOrderController.money.value =
        methodPaidAmounts[index].toStringAsFixed(2);
    update();
  }

  void onNumberPressed(String digit) {
    if (selectedMethodIndex.value < 0) {
      failedSnaskBar('Please select a payment method first');
      return;
    }
    if (payOrderController.money.value == "0" ||
        payOrderController.money.value == "0.00") {
      payOrderController.money.value = digit;
    } else {
      payOrderController.money.value += digit;
    }
    updateMethodPaidAmount();
    update();
  }

  void onClearPressed() {
    if (selectedMethodIndex.value < 0) {
      return;
    }
    if (payOrderController.money.value.isNotEmpty) {
      payOrderController.money.value = payOrderController.money.value
          .substring(0, payOrderController.money.value.length - 1);
      if (payOrderController.money.value.isEmpty) {
        payOrderController.money.value = "0";
      }
      updateMethodPaidAmount();
      update();
    }
  }

  void onAddValue(double value) {
    if (selectedMethodIndex.value < 0) {
      failedSnaskBar('Please select a payment method first');
      return;
    }
    final current = double.tryParse(payOrderController.money.value) ?? 0.0;
    final newVal = current + value;
    payOrderController.money.value = newVal.toStringAsFixed(2);
    updateMethodPaidAmount();
    update();
  }

  void updateMethodPaidAmount() {
    if (selectedMethodIndex.value < 0) {
      return;
    }
    if (selectedMethodIndex.value < methodPaidAmounts.length) {
      final updatedAmounts = List<double>.from(methodPaidAmounts);
      updatedAmounts[selectedMethodIndex.value] =
          double.tryParse(payOrderController.money.value) ?? 0.0;
      methodPaidAmounts.value = updatedAmounts;
      methodPaidAmounts.refresh();
    }
  }

  void validatePayment() async {
    updateMethodPaidAmount();

    final double totalPaid =
        methodPaidAmounts.fold(0.0, (sum, amount) => sum + amount);

    final double totalPrice =
        (Get.arguments?['totalPrice'] as num?)?.toDouble() ?? 0.0;
    final double vatPercentage = double.tryParse(loginController.loginTaskModel
                .data?.company?[0].settings?.invoice?[14].value ??
            '0') ??
        0.0;
    final double vatAmount = totalPrice * (vatPercentage / 100);
    final double requiredTotal = totalPrice + vatAmount;

    if (totalPaid.toStringAsFixed(2) != requiredTotal.toStringAsFixed(2)) {
      failedSnaskBar(
          'The total paid (${totalPaid.toStringAsFixed(2)}) does not equal the required total (${requiredTotal.toStringAsFixed(2)}). Remaining: ${remaining.toStringAsFixed(2)}');
      return;
    }

    bool hasPayments = false;
    for (int i = 0;
        i < paymentMethodsController.paymentMethodsModel.length;
        i++) {
      final double amount = methodPaidAmounts[i];
      if (amount > 0) {
        hasPayments = true;
        await payOrderController.payOrder(
          orderId.toString(),
          orderNumber.toString(),
          paymentMethodsController.paymentMethodsModel[i].id.toString(),
          amount,
        );
      }
    }

    if (!hasPayments) {
      failedSnaskBar('Please enter payment amounts for at least one method');
      return;
    }

    await Get.toNamed(
      Routes.print,
      arguments: {
        'orderId': orderId,
        'orderNumber': orderNumber,
        'totalPrice': totalPrice,
      },
    );
  }

  @override
  void onInit() {
    ever(payOrderController.money, (_) {
      updateMethodPaidAmount();
      update();
    });

    // Listen for changes in payment methods
    ever(paymentMethodsController.paymentMethodsModel, (_) {
      if (paymentMethodsController.paymentMethodsModel.isNotEmpty) {
        methodPaidAmounts.value = List<double>.filled(
            paymentMethodsController.paymentMethodsModel.length, 0.0);
        update();
      }
    });

    // Initialize immediately if data is already available
    if (paymentMethodsController.paymentMethodsModel.isNotEmpty) {
      methodPaidAmounts.value = List<double>.filled(
          paymentMethodsController.paymentMethodsModel.length, 0.0);
    } else {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (paymentMethodsController.paymentMethodsModel.isNotEmpty) {
          methodPaidAmounts.value = List<double>.filled(
              paymentMethodsController.paymentMethodsModel.length, 0.0);
        }
      });
    }

    super.onInit();
  }
}
