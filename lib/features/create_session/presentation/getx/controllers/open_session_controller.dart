import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/create_session/data/models/open_session_model.dart';
import 'package:point_of_sale/features/create_session/domain/intities/open_session_intity.dart';
import 'package:point_of_sale/features/create_session/domain/use_case/open_session_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class OpenSessionController extends GetxController {
  TextEditingController openCashController = TextEditingController();
  TextEditingController openNotesController = TextEditingController();
  final loading = true.obs;
  final OpenSessionUseCase openSessionUseCase;
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  OpenSessionModel openSessionModel = OpenSessionModel();

  OpenSessionController(this.openSessionUseCase);

  Future<void> openSession(String sessionCode) async {
    final result = await openSessionUseCase(
      OpenSessionIntity(
        loading: loading,
        tenantId: cashDataSource.box.read('tenantId'),
        companyId: cashDataSource.box.read('companyId'),
        branchId: cashDataSource.box.read('branchId'),
        createdBy: cashDataSource.box.read('userId'),
        openCash: openCashController.text,
        openNotes: openNotesController.text,
        sessionCode: sessionCode,
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
        openSessionModel = data;
        Get.toNamed(Routes.home);
        successSnackBar(
          'sessionCreatedsuccessfully'.tr,
        );
      },
    );
  }
}
