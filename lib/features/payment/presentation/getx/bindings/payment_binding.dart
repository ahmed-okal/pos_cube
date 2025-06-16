import 'package:get/get.dart';
import 'package:point_of_sale/features/auth/login/presentation/getx/controllers/login_controller.dart';
import 'package:point_of_sale/injection_controller.dart';

import '../../../../../core/services/cash_data_source.dart';
import '../../../../home/presentation/getx/controllers/order_controller.dart';
import '../../../../home/presentation/getx/controllers/order_details_controller.dart';
import '../../../../home/presentation/getx/controllers/orders_list_controller.dart';
import '../controllers/pay_order_controller.dart';
import '../controllers/payment_controller.dart';
import '../controllers/payment_methods_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(
      () => OrderDetailsController(
        InjectionController().getIt(),
      ),
    );

    Get.lazyPut<PaymentMethodsController>(
      () => PaymentMethodsController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<PayOrderController>(
      () => PayOrderController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<PaymentController>(
      () => PaymentController(
          // InjectionController().getIt(),
          ),
    );
    Get.lazyPut<OrdersListController>(
      () => OrdersListController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<OrderController>(
      () => OrderController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut(
      () => CashDataSource(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        InjectionController().getIt(),
      ),
    );
  }
}
