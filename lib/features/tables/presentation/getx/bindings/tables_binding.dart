import 'package:get/get.dart';
import 'package:point_of_sale/core/services/cash_data_source.dart';
import 'package:point_of_sale/features/auth/login/presentation/getx/controllers/login_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/cash_in_out_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/drawer_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/edit_item_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/get_cash_in_out_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_details_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/orders_list_controller.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/date_picker_controller.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/reseervation_filter_tap_bar_controller.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/time_picker_controller.dart';
import 'package:point_of_sale/injection_controller.dart';

import '../../../../home/presentation/getx/controllers/categories_controller.dart';
import '../../../../home/presentation/getx/controllers/create_new_order_controller.dart';
import '../../../../home/presentation/getx/controllers/customers_controller.dart';
import '../controllers/add_new_reservation_controller.dart';
import '../controllers/add_new_reservation_date_picker_controller.dart';
import '../controllers/available_reservation_controller.dart';
import '../controllers/cancel_reservation_controller.dart';
import '../controllers/complete_reservation_controller.dart';
import '../controllers/reservation_search_controller.dart';
import '../controllers/reservations_controller.dart';
import '../controllers/tables_controller.dart';

class TablesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TablesController>(
      () => TablesController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<DatePickerController>(
      () => DatePickerController(),
    );
    Get.lazyPut<TimePickerController>(
      () => TimePickerController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<AddNewReservationDatePickerController>(
      () => AddNewReservationDatePickerController(),
    );
    Get.lazyPut<TimePickerController>(
      () => TimePickerController(),
    );
    Get.lazyPut<AddNewReservationController>(
      () => AddNewReservationController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CustomersController>(
      () => CustomersController(
        InjectionController().getIt(),
      ),
    );
    // Add AppDrawerController for the drawer
    Get.lazyPut<AppDrawerController>(
      () => AppDrawerController(),
    );
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CreateNewOrderController>(
      () => CreateNewOrderController(
        InjectionController().getIt(),
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
    Get.lazyPut<OrderDetailsController>(
      () => OrderDetailsController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<AvailableReservationController>(
      () => AvailableReservationController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<ReservationsController>(
      () => ReservationsController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CancelReservationController>(
      () => CancelReservationController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CompleteReservationController>(
      () => CompleteReservationController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<ReservationSearchController>(
      () => ReservationSearchController(),
    );
    Get.lazyPut<EditItemController>(
      () => EditItemController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CashInOutController>(
      () => CashInOutController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<GetCashInOutController>(
      () => GetCashInOutController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CashDataSource>(
      () => CashDataSource(),
    );
    Get.lazyPut<ReseervationFilterTapBarController>(
      () => ReseervationFilterTapBarController(
          // InjectionController().getIt(),
          ),
    );
  }
}
