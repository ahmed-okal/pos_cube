import 'package:get/get.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../../create_session/presentation/getx/controllers/open_session_controller.dart';
import '../../../data/models/get_cash_in_out_model.dart';
import '../../../domain/entitis/get_cash_in_out_entity.dart';
import '../../../domain/use_case/get_cash_in_out_use_case.dart';

class GetCashInOutController extends GetxController {
  final GetCashInOutUseCase getCashInOutUseCase;
  final loading = true.obs;
  GetCashInOutModel getCashInOutModel = GetCashInOutModel();

  GetCashInOutController(this.getCashInOutUseCase);
  final OpenSessionController openSessionController =
      Get.find<OpenSessionController>();

  final CashDataSource cashDataSource = Get.put(CashDataSource());
  double get sumCashIn => (getCashInOutModel.data ?? [])
      .where((e) => e.cashType == 'in')
      .fold(0.0, (sum, e) => sum + e.cashAmount);

  double get sumCashOut => (getCashInOutModel.data ?? [])
      .where((e) => e.cashType == 'out')
      .fold(0.0, (sum, e) => sum + e.cashAmount);

  double get netCash => sumCashIn - sumCashOut;

  Future<void> getCashInOut() async {
    final result = await getCashInOutUseCase(
      GetCashInOutEntity(
        loading: loading,
        sessionId:
            openSessionController.openSessionModel.data?.id.toString() ?? '',
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
        getCashInOutModel = data;
      },
    );
  }
}
