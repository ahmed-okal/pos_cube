import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/home/data/models/create_new_order_model.dart';
import 'package:point_of_sale/features/home/domain/use_case/create_new_order_use_case.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../../tables/presentation/getx/controllers/tables_controller.dart';
import '../../../domain/entitis/create_new_order_entity.dart';
import 'orders_list_controller.dart';

class CreateNewOrderController extends GetxController {
  CreateNewOrderModel createNewOrderModel = CreateNewOrderModel();
  final OrdersListController ordersListController =
      Get.find<OrdersListController>();
  final OrderController orderController = Get.find<OrderController>();
  final CreateNewOrderUseCase createNewOrderUseCase;
  final loading = true.obs;
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  final TablesController tablesController = Get.find<TablesController>();
  CreateNewOrderController(this.createNewOrderUseCase);
  final RxInt orderType = (0).obs;
  void setOrderType(int value) {
    orderType.value = value;
  }

  Future<void> getCreateNewOrder() async {
    final result = await createNewOrderUseCase(
      CreateNewOrderEntity(
        loading: loading,
        tenantId: cashDataSource.box.read('tenantId'),
        companyId: cashDataSource.box.read('companyId'),
        branchId: cashDataSource.box.read('branchId'),
        userId: cashDataSource.box.read('userId'),
        tableId: orderType.value == 0
            ? '0'
            : '${tablesController.tablesModel.data?[tablesController.selectTablesPlase.value].tables?[tablesController.selectedTable.value].id}',
      ),
    );
    await Get.find<OrdersListController>().handleNewOrder();
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
        successSnackBar('orderCreatedSuccessfully'.tr);
        createNewOrderModel = data;
        ordersListController.scrollController;
      },
    );
  }
}
