import 'package:get/get.dart';
import 'package:point_of_sale/features/auth/login/presentation/getx/controllers/login_controller.dart';
import 'package:point_of_sale/features/create_session/presentation/getx/controllers/open_session_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/get_cash_in_out_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/orders_list_controller.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/date_picker_controller.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/reservations_controller.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/tables_controller.dart';

import '../../../../../core/services/cash_data_source.dart';
import '../../../../../injection_controller.dart';
import '../../../../home/presentation/getx/controllers/close_session_controller.dart';
import '../../../../home/presentation/getx/controllers/create_new_order_controller.dart';
import '../../../../home/presentation/getx/controllers/order_controller.dart';
import '../../../../home/presentation/getx/controllers/order_details_controller.dart';
import '../../../../settings/presentation/getx/controllers/printers_ip_address_controller.dart';
import '../controllers/print_controller.dart';
import '../controllers/print_order_controller.dart';

class PrintBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrintController>(
      () => PrintController(),
    );
    Get.lazyPut<OrderDetailsController>(
      () => OrderDetailsController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CreateNewOrderController>(
      () => CreateNewOrderController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<PrintOrderController>(
      () => PrintOrderController(),
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
    Get.lazyPut<TablesController>(
      () => TablesController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<ReservationsController>(
      () => ReservationsController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<GetCashInOutController>(
      () => GetCashInOutController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<OpenSessionController>(
      () => OpenSessionController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CloseSessionController>(
      () => CloseSessionController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<DatePickerController>(
      () => DatePickerController(),
    );
    Get.lazyPut<PrintersIPAddressController>(
      () => PrintersIPAddressController(),
    );
  }
}
