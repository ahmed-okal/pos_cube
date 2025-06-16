import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/home/data/models/order_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/order_entity.dart';
import 'package:point_of_sale/features/home/domain/use_case/order_use_case.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_details_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/orders_list_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../../auth/login/presentation/getx/controllers/login_controller.dart';

class OrderController extends GetxController {
  RxList<Map<String, String>> localCart = <Map<String, String>>[].obs;
  final OrderDetailsController orderDetailsController =
      Get.find<OrderDetailsController>();
  final LoginController loginController = Get.find<LoginController>();
  OrderModel orderModel = OrderModel();
  final OrdersListController ordersListController =
      Get.find<OrdersListController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final OrderUseCase orderUseCase;
  final loading = true.obs;
  final TextEditingController qty = TextEditingController();
  RxBool isOrderOpen = false.obs;
  OrderController(this.orderUseCase);
  RxInt selectedIndex = (-1).obs;

  void foodItemToggle() => isOrderOpen.value = !isOrderOpen.value;
  void toggleSelection(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1;
    } else {
      selectedIndex.value = index;
    }
  }

  Future<void> fetchOrder(
    String productId,
    String productName,
    int selectedQuantity,
    String price,
    String totalPrice,
    int orderId,
    String orderNo,
  ) async {
    final result = await orderUseCase(
      OrderParam(
        loading: loading,
        orderId: '$orderId',
        orderNo: orderNo,
        productId: productId,
        productName: productName,
        // productDesc: orderModel.data?.productDesc ?? '',
        // unitId: orderModel.data?.unitId ?? '',
        qty: selectedQuantity.toString(),
        price: price,
        totalPrice: totalPrice,
        // productDiscount: orderModel.data?.productDiscount ?? '',
        // productNetTotal: orderModel.data?.productNetTotal ?? '',
        // productVat: orderModel.data?.productVat ?? '',
        // productNetTotalWithVat: orderModel.data?.productNetTotalWithVat ?? '',
      ),
    );
    result.fold(
      (failure) {
        String errorMessage;
        if (failure is ServerFailure) {
          errorMessage = failure.message;
        } else if (failure is AppExceptions) {
          errorMessage = failure.message;
        } else {
          errorMessage = 'somethingWentWrongPleaseTryAgainLater'.tr;
        }

        failedSnaskBar(errorMessage);
      },
      (data) {
        orderModel = data;
        successSnackBar('itemAddedSuccessfully'.tr);
      },
    );
  }
}
