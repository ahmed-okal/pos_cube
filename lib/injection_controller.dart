import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:point_of_sale/features/create_session/data/remote/generate_session_remote_data_source.dart';
import 'package:point_of_sale/features/create_session/data/remote/open_session_remote_data_source.dart';
import 'package:point_of_sale/features/create_session/data/repo_impl/generate_session_repo_impl.dart';
import 'package:point_of_sale/features/create_session/data/repo_impl/open_session_repo_impl.dart';
import 'package:point_of_sale/features/create_session/domain/repo/generate_session_repo.dart';
import 'package:point_of_sale/features/create_session/domain/repo/open_session_repo.dart';
import 'package:point_of_sale/features/create_session/domain/use_case/generate_session_use_case.dart';
import 'package:point_of_sale/features/create_session/domain/use_case/open_session_use_case.dart';
import 'package:point_of_sale/features/home/data/remote/add_customer_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/all_category_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/cash_in_out_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/categories_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/close_session_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/create_new_order_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/customers_group_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/delete_item_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/edit_item_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/kitchen_note_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/order_details_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/order_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/price_list_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/remote/search_remote_data_source.dart';
import 'package:point_of_sale/features/home/data/repo_impl/add_customer_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/categories_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/create_new_order_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/customers_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/delete_item_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/edit_item_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/kitchen_note_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/order_details_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/order_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/price_list_repo_impl.dart';
import 'package:point_of_sale/features/home/data/repo_impl/search_repo_impl.dart';
import 'package:point_of_sale/features/home/domain/repo/add_customer_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/all_category_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/cash_in_out_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/categories_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/create_new_order_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/customers_group_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/customers_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/delete_item_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/edit_item_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/kitchen_note_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/order_details_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/order_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/price_list_repo.dart';
import 'package:point_of_sale/features/home/domain/repo/search_repo.dart';
import 'package:point_of_sale/features/home/domain/use_case/add_customer_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/all_category_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/cash_in_out_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/categories_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/create_new_order_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/customers_group_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/customers_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/delete_item_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/edit_item_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/kitchen_note_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/order_details_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/order_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/price_list_use_case.dart';
import 'package:point_of_sale/features/home/domain/use_case/search_use_case.dart';
import 'package:point_of_sale/features/payment/data/remote/pay_order_remote_data_source.dart';
import 'package:point_of_sale/features/payment/data/remote/payment_methods_remote_data_source.dart';
import 'package:point_of_sale/features/payment/data/repo_impl/payment_methods_repo_impl.dart';
import 'package:point_of_sale/features/payment/domain/repo/pay_order_repo.dart';
import 'package:point_of_sale/features/payment/domain/repo/payment_methods_repo.dart';
import 'package:point_of_sale/features/payment/domain/use_case/pay_order_use_case.dart';
import 'package:point_of_sale/features/payment/domain/use_case/payment_methods_use_case.dart';
import 'package:point_of_sale/features/tables/data/remote/add_new_reservation_remote_data_source.dart';
import 'package:point_of_sale/features/tables/data/remote/available_reservation_remote_data_source.dart';
import 'package:point_of_sale/features/tables/data/remote/reservation_action_remote_data_source.dart';
import 'package:point_of_sale/features/tables/data/remote/reservations_remote_data_source.dart';
import 'package:point_of_sale/features/tables/data/repo_impl/add_new_reservation_repo_impl.dart';
import 'package:point_of_sale/features/tables/data/repo_impl/available_reservation_repo_impl.dart';
import 'package:point_of_sale/features/tables/data/repo_impl/reservation_action_repo_impl.dart';
import 'package:point_of_sale/features/tables/data/repo_impl/reservations_repo_impl.dart';
import 'package:point_of_sale/features/tables/domain/repo/add_new_reservation_repo.dart';
import 'package:point_of_sale/features/tables/domain/repo/available_reservation_repo.dart';
import 'package:point_of_sale/features/tables/domain/repo/reservation_action_repo.dart';
import 'package:point_of_sale/features/tables/domain/repo/reservations_repo.dart';
import 'package:point_of_sale/features/tables/domain/use_case/add_new_reservation_use_case.dart';
import 'package:point_of_sale/features/tables/domain/use_case/available_reservation_use_case.dart';
import 'package:point_of_sale/features/tables/domain/use_case/reservation_action_use_case.dart';
import 'package:point_of_sale/features/tables/domain/use_case/reservations_use_case.dart';

import 'core/services/api_service.dart';
import 'core/services/cash_data_source.dart';
import 'core/services/language_service.dart';
import 'core/services/theme_service.dart';
import 'features/auth/login/data/remote/remote_data_source.dart';
import 'features/auth/login/data/repo_impl/login_repo_impl.dart';
import 'features/auth/login/domain/repo/login_repo.dart';
import 'features/auth/login/domain/use_cases/login_use_case.dart';
import 'features/home/data/remote/customers_remote_data_source.dart';
import 'features/home/data/remote/get_cash_in_out_remote_data_source.dart';
import 'features/home/data/remote/orders_list_remote_data_source.dart';
import 'features/home/data/repo_impl/all_category_repo_impl.dart';
import 'features/home/data/repo_impl/cash_in_out_repo_impl.dart';
import 'features/home/data/repo_impl/close_session_repo_impl.dart';
import 'features/home/data/repo_impl/customers_group_repo_impl.dart';
import 'features/home/data/repo_impl/get_cash_in_out_repo_impl.dart';
import 'features/home/data/repo_impl/orders_list_repo_impl.dart';
import 'features/home/domain/repo/close_session_repo.dart';
import 'features/home/domain/repo/get_cash_in_out_repo.dart';
import 'features/home/domain/repo/orders_list_repo.dart';
import 'features/home/domain/use_case/close_session_use_case.dart';
import 'features/home/domain/use_case/get_cash_in_out_use_case.dart';
import 'features/home/domain/use_case/orders_list_use_case.dart';
import 'features/payment/data/repo_impl/pay_order_repo_impl.dart';
import 'features/tables/data/remote/get_tables_remote_data_source.dart';
import 'features/tables/data/repo_impl/get_tables_repo_impl.dart';
import 'features/tables/domain/repo/get_tables_repo.dart';
import 'features/tables/domain/use_case/get_tables_use_case.dart';

class InjectionController {
  final getIt = GetIt.instance;
  Future<void> initialize() async {
    getIt.registerLazySingleton<ApiService>(
      () => ApiService(),
    );

    // Register theme and language services with GetIt
    getIt.registerLazySingleton<ThemeService>(
      () => ThemeService(),
    );

    getIt.registerLazySingleton<LanguageService>(
      () => LanguageService(),
    );

    // Also register with GetX for widgets that use Get.find()
    Get.put(ThemeService(), permanent: true);
    Get.put(LanguageService(), permanent: true);

    getIt.registerLazySingleton<CashDataSource>(
      () => CashDataSource(
          // getIt(),
          ),
    );
    getIt.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<LogInRepo>(
      () => LoginRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CategoriesRepo>(
      () => CategoriesRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CategoriesUseCase>(
      () => CategoriesUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CreateNewOrderRemoteDataSource>(
      () => CreateNewOrderRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CreateNewOrderRepo>(
      () => CreateNewOrderRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CreateNewOrderUseCase>(
      () => CreateNewOrderUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OrderRepo>(
      () => OrderRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OrderUseCase>(
      () => OrderUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OrdersListRemoteDataSource>(
      () => OrdersListRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OrdersListRepo>(
      () => OrdersListRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OrdersListUseCase>(
      () => OrdersListUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<DeleteItemRemoteDataSource>(
      () => DeleteItemRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<DeleteItemRepo>(
      () => DeleteItemRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<DeleteItemUseCase>(
      () => DeleteItemUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<EditItemRemoteDataSource>(
      () => EditItemRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<EditItemRepo>(
      () => EditItemRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<EditItemUseCase>(
      () => EditItemUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<GenerateSessionRemoteDataSource>(
      () => GenerateSessionRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<GenerateSessionRepo>(
      () => GenerateSessionRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<GenerateSessionUseCase>(
      () => GenerateSessionUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OpenSessionRemoteDataSource>(
      () => OpenSessionRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OpenSessionRepo>(
      () => OpenSessionRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OpenSessionUseCase>(
      () => OpenSessionUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CloseSessionRemoteDataSource>(
      () => CloseSessionRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CloseSessionRepo>(
      () => CloseSessionRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CloseSessionUseCase>(
      () => CloseSessionUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<PaymentMethodsRemoteDataSource>(
      () => PaymentMethodsRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<PaymentMethodsRepo>(
      () => PaymentMethodsRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<PaymentMethodsUseCase>(
      () => PaymentMethodsUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<PayOrderRemoteDataSource>(
      () => PayOrderRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<PayOrderRepo>(
      () => PayOrderRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<PayOrderUseCase>(
      () => PayOrderUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AllCategoryRemoteDataSource>(
      () => AllCategoryRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AllCategoryRepo>(
      () => AllCategoryRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AllCategoryUseCase>(
      () => AllCategoryUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<SearchRepo>(
      () => SearchRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<SearchUseCase>(
      () => SearchUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OrderDetailsRemoteDataSource>(
      () => OrderDetailsRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OrderDetailsRepo>(
      () => OrderDetailsRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<OrderDetailsUseCase>(
      () => OrderDetailsUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AddCustomerRemoteDataSource>(
      () => AddCustomerRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AddCustomerRepo>(
      () => AddCustomerRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AddCustomerUseCase>(
      () => AddCustomerUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CustomersRemoteDataSource>(
      () => CustomersRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CustomersRepo>(
      () => CustomersRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CustomersUseCase>(
      () => CustomersUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<KitchenNoteRemoteDataSource>(
      () => KitchenNoteRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<KitchenNoteRepo>(
      () => KitchenNoteRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<KitchenNoteUseCase>(
      () => KitchenNoteUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CashInOutRemoteDataSource>(
      () => CashInOutRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CashInOutRepo>(
      () => CashInOutRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CashInOutUseCase>(
      () => CashInOutUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<GetCashInOutRemoteDataSource>(
      () => GetCashInOutRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<GetCashInOutRepo>(
      () => GetCashInOutRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<GetCashInOutUseCase>(
      () => GetCashInOutUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<PriceListRemoteDataSource>(
      () => PriceListRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<PriceListRepo>(
      () => PriceListRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<PriceListUseCase>(
      () => PriceListUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CustomersGroupRemoteDataSource>(
      () => CustomersGroupRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CustomersGroupRepo>(
      () => CustomersGroupRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<CustomersGroupUseCase>(
      () => CustomersGroupUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<GetTablesRemoteDataSource>(
      () => GetTablesRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<GetTablesRepo>(
      () => GetTablesRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<GetTablesUseCase>(
      () => GetTablesUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AddNewReservationRemoteDataSource>(
      () => AddNewReservationRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AddNewReservationRepo>(
      () => AddNewReservationRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AddNewReservationUseCase>(
      () => AddNewReservationUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AvailableReservationRemoteDataSource>(
      () => AvailableReservationRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AvailableReservationRepo>(
      () => AvailableReservationRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<AvailableReservationUseCase>(
      () => AvailableReservationUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<ReservationsRemoteDataSource>(
      () => ReservationsRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<ReservationsRepo>(
      () => ReservationsRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<ReservationsUseCase>(
      () => ReservationsUseCase(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<ReservationActionRemoteDataSource>(
      () => ReservationActionRemoteDataSourceImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<ReservationActionRepo>(
      () => ReservationActionRepoImpl(
        getIt(),
      ),
    );
    getIt.registerLazySingleton<ReservationActionUseCase>(
      () => ReservationActionUseCase(
        getIt(),
      ),
    );
  }
}
