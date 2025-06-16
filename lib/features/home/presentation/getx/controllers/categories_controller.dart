import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/auth/login/presentation/getx/controllers/login_controller.dart';
import 'package:point_of_sale/features/home/data/models/categories_model.dart';
import 'package:point_of_sale/features/home/domain/use_case/categories_use_case.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/all_category_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/cash_in_out_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/create_new_order_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/customers_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/delete_item_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/get_cash_in_out_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_keyboard_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../../tables/presentation/getx/controllers/tables_controller.dart';
import '../../../domain/entitis/categories_entity.dart';
import 'edit_item_controller.dart';
import 'orders_list_controller.dart';

class CategoriesController extends GetxController {
  final EditItemController editItemController = Get.find<EditItemController>();
  final CashInOutController cashInOutController =
      Get.find<CashInOutController>();
  final TablesController tablesController = Get.find<TablesController>();
  final GetCashInOutController getCashInOutController =
      Get.find<GetCashInOutController>();
  final CustomersController customersController =
      Get.find<CustomersController>();
  final OrderKeyboardController orderKeyboardController =
      Get.find<OrderKeyboardController>();
  final DeleteItemController deleteItemController =
      Get.find<DeleteItemController>();
  final OrderController orderController = Get.find<OrderController>();
  final AllCategoryController allCategoryController =
      Get.find<AllCategoryController>();
  // final OrderDetailsController orderDetailsController =
  //     Get.find<OrderDetailsController>();
  final OrdersListController ordersListController =
      Get.find<OrdersListController>();
  final CreateNewOrderController createNewOrderController =
      Get.find<CreateNewOrderController>();
  final LoginController loginController = Get.find<LoginController>();
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  final CategoriesUseCase categoriesUseCase;
  CatigoriesTaskModel categoriesTaskModel = CatigoriesTaskModel();
  final loading = true.obs;
  final selectedIndex = 0.obs;
  late PageController pageController;
  void changeCategory(int index) {
    selectedIndex.value = index;
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    update();
  }

  // RxInt selctedItem = (-1).obs;

  CategoriesController(this.categoriesUseCase);
  Future<void> getCategories() async {
    final result = await categoriesUseCase(
      CategoriesEntity(
        loading: loading,
        tenantId: cashDataSource.box.read('tenantId'),
        companyId: cashDataSource.box.read('companyId'),
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
        categoriesTaskModel = data;
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController(initialPage: 0);
    await getCategories();
    ordersListController.ordersListModel.data?.isEmpty == true
        ? createNewOrderController.getCreateNewOrder()
        : null;
  }

  Future<void> refreshData() async {
    await getCategories();
    await allCategoryController.getAllCategory();
    await ordersListController.getOrdersList();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
