import 'package:get/get.dart';
import 'package:point_of_sale/features/home/data/models/order_details_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/order_details_intity.dart';
import 'package:point_of_sale/features/home/domain/use_case/order_details_use_case.dart';
import 'package:point_of_sale/features/print/presentation/getx/controllers/print_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class OrderDetailsController extends GetxController {
  final loading = true.obs;
  final int index = 0;

  OrderDetailsModel orderDetailsModel = OrderDetailsModel();
  final OrderDetailsUseCase orderDetailsUseCase;
  OrderDetailsController(this.orderDetailsUseCase);
  // final int orderId = Get.arguments['orderId'] ?? 0;
  Future<void> getOrderDetails(
    int orderId,
  ) async {
    final result = await orderDetailsUseCase(
      OrderDetailsIntity(
        loading: loading,
        orderId: orderId,
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
        orderDetailsModel = data;
        if (Get.isRegistered<PrintController>()) {
          Get.find<PrintController>()
              .total(orderDetailsModel.data?.paymentTransactions?.fold(
                    0,
                    (sum, transaction) {
                      return sum! +
                          (int.tryParse(
                                transaction.amount ?? '0',
                              ) ??
                              0);
                    },
                  ) ??
                  0);
        }
      },
    );
  }

  @override
  void onInit() {
    // final int orderId = Get.arguments['orderId'] ?? 0;
    // getOrderDetails(orderId);
    super.onInit();
  }
}
