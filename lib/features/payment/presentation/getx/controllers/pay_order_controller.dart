import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/payment/data/models/pay_order_model.dart';
import 'package:point_of_sale/features/payment/domain/intities/pay_order_entity.dart';
import 'package:point_of_sale/features/payment/domain/use_case/pay_order_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class PayOrderController extends GetxController {
  final PayOrderUseCase payOrderUseCase;
  final loading = true.obs;
  var money = '0.00'.obs;
  var notes = ''.obs;
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  PayOrderModel payOrderModel = PayOrderModel();

  PayOrderController(this.payOrderUseCase);

  Future<void> payOrder(String orderId, String orderNumber,
      String paymentMethodId, double amount) async {
    final result = await payOrderUseCase(
      PayOrderEntity(
        loading: loading,
        tenantId: cashDataSource.box.read('tenantId'),
        companyId: cashDataSource.box.read('companyId'),
        branchId: cashDataSource.box.read('branchId'),
        orderId: orderId,
        orderNumber: orderNumber,
        paymentMethodId: paymentMethodId,
        userId: cashDataSource.box.read('userId'),
        amount: amount.toString(),
        notes: notes.string,
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
        payOrderModel = data;
        successSnackBar(
          'you have successfully paid $amount for the order',
        );
      },
    );
  }
}
