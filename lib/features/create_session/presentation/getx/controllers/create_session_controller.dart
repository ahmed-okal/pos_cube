import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/failed_snack_bar.dart';
import 'package:point_of_sale/features/create_session/data/models/generate_session_mosel.dart';
import 'package:point_of_sale/features/create_session/domain/intities/generate_session_intity.dart';
import 'package:point_of_sale/features/create_session/domain/use_case/generate_session_use_case.dart';
import 'package:point_of_sale/features/create_session/presentation/getx/controllers/clock_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import 'open_session_controller.dart';

class CreateSessionController extends GetxController {
  final ClockController clockController = Get.put(ClockController());
  final OpenSessionController openSessionController =
      Get.find<OpenSessionController>();
  final GenerateSessionUseCase generateSessionUseCase;
  final loading = true.obs;
  final RxString session = ''.obs;
  final CashDataSource cashDataSource = Get.put(CashDataSource());

  GenerateSessionModel generateSessionModel = GenerateSessionModel();
  CreateSessionController(this.generateSessionUseCase);
  Future<void> generateSession() async {
    final result = await generateSessionUseCase(
      GenerateSessionIntity(
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
        generateSessionModel = data;
      },
    );
  }
}
