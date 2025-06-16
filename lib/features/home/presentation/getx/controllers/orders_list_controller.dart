import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/data/models/orders_list_model.dart';
import 'package:point_of_sale/features/home/domain/use_case/orders_list_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../domain/entitis/orders_list_entity.dart';

class OrdersListController extends GetxController {
  OrdersListModel ordersListModel = OrdersListModel();
  // final OrderController orderController = Get.find<OrderController>();

  final OrdersListUseCase ordersListUseCase;
  late ScrollController scrollController;
  final loading = true.obs;
  final order = 0.obs;
  final CashDataSource cashDataSource = Get.put(CashDataSource());

  OrdersListController(this.ordersListUseCase);

  Future<void> getOrdersList() async {
    final result = await ordersListUseCase(
      OrdersListEntity(
        loading: loading,
        tenantId: cashDataSource.box.read('tenantId'),
        companyId: cashDataSource.box.read('companyId'),
        branchId: cashDataSource.box.read('branchId'),
        userId: cashDataSource.box.read('userId'),
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
        ordersListModel = data;
      },
    );
  }

  void scrollToSelected(int index, GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: 0.5,
      );
    }
  }

  Future<void> handleNewOrder() async {
    await getOrdersList();
    if (ordersListModel.data != null && ordersListModel.data!.isNotEmpty) {
      int lastIndex = ordersListModel.data!.length - 1;
      order.value = lastIndex;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void onInit() async {
    super.onInit();
    scrollController = ScrollController();
    await getOrdersList();
    if (ordersListModel.data != null && ordersListModel.data!.isNotEmpty) {
      int lastIndex = ordersListModel.data!.length - 1;
      order.value = lastIndex;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients &&
          ordersListModel.data != null &&
          ordersListModel.data!.isNotEmpty) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
