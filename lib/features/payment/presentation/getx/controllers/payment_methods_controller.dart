import 'package:get/get.dart';
import 'package:point_of_sale/features/payment/data/models/payment_methods_model.dart';
import 'package:point_of_sale/features/payment/domain/intities/payment_methods_entity.dart';
import 'package:point_of_sale/features/payment/domain/use_case/payment_methods_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class PaymentMethodsController extends GetxController {
  // final OrdersListController ordersListController =
  //     Get.find<OrdersListController>();
  // final OrderDetailsController orderDetailsController =
  //     Get.find<OrderDetailsController>();
  // final PayOrderController payOrderController = Get.find<PayOrderController>();
  RxList<PaymentMethodsModel> paymentMethodsModel = <PaymentMethodsModel>[].obs;
  final loading = true.obs;
  // final formKey = GlobalKey<FormState>();
  final PaymentMethodsUseCase paymentMethodsUseCase;
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  PaymentMethodsController(this.paymentMethodsUseCase);
  Future<void> getPaymentMethods() async {
    final result = await paymentMethodsUseCase(
      PaymentMethodsEntity(
        loading: loading,
        tenantId: cashDataSource.box.read('tenantId'),
        companyId: cashDataSource.box.read('companyId'),
        branchId: cashDataSource.box.read('branchId'),
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
        paymentMethodsModel.assignAll(data);
      },
    );
  }

  @override
  void onInit() {
    getPaymentMethods();
    // Add a listener to refresh UI when payment methods are loaded
    ever(loading, (isLoading) {
      if (!isLoading && paymentMethodsModel.isNotEmpty) {
        update();
      }
    });
    super.onInit();
  }
}
