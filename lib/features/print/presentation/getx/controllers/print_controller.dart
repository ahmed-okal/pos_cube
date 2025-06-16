import 'package:get/get.dart';
import 'package:point_of_sale/features/auth/login/presentation/getx/controllers/login_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/create_new_order_controller.dart';

import '../../../../../core/services/cash_data_source.dart';
import '../../../../home/presentation/getx/controllers/order_details_controller.dart';

class PrintController extends GetxController {
  final int orderId = Get.arguments?['orderId'] ?? 0;
  final int orderNumber =
      int.tryParse(Get.arguments?['orderNumber'].toString() ?? '0') ?? 0;
  final double totalPrice = Get.arguments?['totalPrice'] ?? 0;
  final OrderDetailsController orderDetailsController =
      Get.find<OrderDetailsController>();

  final CreateNewOrderController createNewOrderController =
      Get.find<CreateNewOrderController>();
  final LoginController loginController = Get.find<LoginController>();
  final CashDataSource cashDataSource = Get.put(CashDataSource());

  @override
  void onInit() {
    orderDetailsController.getOrderDetails(orderId);

    super.onInit();
  }

  @override
  void onClose() {
    orderDetailsController.getOrderDetails(orderId);

    super.onDelete();
  }

  RxDouble total = 0.00.obs;
}
