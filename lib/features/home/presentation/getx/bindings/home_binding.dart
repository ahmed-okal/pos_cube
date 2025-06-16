import 'package:get/get.dart';
import 'package:point_of_sale/features/create_session/presentation/getx/controllers/open_session_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/close_session_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/create_new_order_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/delete_item_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/drawer_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/holding_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_controller.dart';
import 'package:point_of_sale/injection_controller.dart';

import '../../../../../../core/services/cash_data_source.dart';
import '../../../../auth/login/presentation/getx/controllers/login_controller.dart';
import '../../../../tables/presentation/getx/controllers/cancel_reservation_controller.dart';
import '../../../../tables/presentation/getx/controllers/complete_reservation_controller.dart';
import '../../../../tables/presentation/getx/controllers/date_picker_controller.dart';
import '../../../../tables/presentation/getx/controllers/reservations_controller.dart';
import '../../../../tables/presentation/getx/controllers/tables_controller.dart';
import '../controllers/add_customer_controller.dart';
import '../controllers/all_category_controller.dart';
import '../controllers/cash_in_out_controller.dart';
import '../controllers/categories_controller.dart';
import '../controllers/customers_controller.dart';
import '../controllers/customers_group_controller.dart';
import '../controllers/edit_item_controller.dart';
import '../controllers/get_cash_in_out_controller.dart';
import '../controllers/kitchen_note_controller.dart';
import '../controllers/order_details_controller.dart';
import '../controllers/order_keyboard_controller.dart';
import '../controllers/orders_list_controller.dart';
import '../controllers/payment_button_action_controller.dart';
import '../controllers/price_list_controller.dart';
import '../controllers/search_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashDataSource());
    Get.lazyPut<LoginController>(
      () => LoginController(
        InjectionController().getIt(),
      ),
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
    Get.lazyPut<OrderController>(
      () => OrderController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<OrdersListController>(
      () => OrdersListController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<DeleteItemController>(
      () => DeleteItemController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<EditItemController>(
      () => EditItemController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CloseSessionController>(
      () => CloseSessionController(
        InjectionController().getIt(),
      ),
      fenix: true,
    );

    Get.lazyPut<AllCategoryController>(
      () => AllCategoryController(
        InjectionController().getIt(),
      ),
    );
    // Get.lazyPut<SearchFoodController>(
    //   () => SearchFoodController(
    //     InjectionController().getIt(),
    //   ),
    // );
    Get.lazyPut<OrderKeyboardController>(
      () => OrderKeyboardController(),
    );
    Get.lazyPut<OrderDetailsController>(
      () => OrderDetailsController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<AddCustomerController>(
      () => AddCustomerController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CustomersController>(
      () => CustomersController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CashInOutController>(
      () => CashInOutController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<KitchenNoteController>(
      () => KitchenNoteController(
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
    Get.lazyPut<PriceListController>(
      () => PriceListController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CustomersGroupController>(
      () => CustomersGroupController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<SearchFoodController>(
      () => SearchFoodController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<TablesController>(
      () => TablesController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<DatePickerController>(
      () => DatePickerController(),
    );
    Get.lazyPut<PaymentButtonActionController>(
      () => PaymentButtonActionController(),
    );
    Get.lazyPut<HoldingController>(
      () => HoldingController(),
    );

    // Add AppDrawerController for the drawer
    Get.lazyPut<AppDrawerController>(
      () => AppDrawerController(),
    );
    // Get.lazyPut<AvailableReservationController>(
    //  () => AvailableReservationController(
    //     InjectionController().getIt(),
    //   ),
    // );
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
    Get.lazyPut<EditItemController>(
      () => EditItemController(
        InjectionController().getIt(),
      ),
    );
  }
}
