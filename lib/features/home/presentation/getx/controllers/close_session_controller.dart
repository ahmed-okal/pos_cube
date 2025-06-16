import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/home/data/models/close_session_model.dart';
import 'package:point_of_sale/features/home/domain/use_case/close_session_use_case.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/get_cash_in_out_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../../create_session/presentation/getx/controllers/open_session_controller.dart';
import '../../../domain/entitis/close_session_entity.dart';

class CloseSessionController extends GetxController {
  final CloseSessionUseCase closeSessionUseCase;
  final OpenSessionController openSessionController =
      Get.find<OpenSessionController>();
  final GetCashInOutController getCashInOutController =
      Get.find<GetCashInOutController>();
  TextEditingController closeCash = TextEditingController();
  TextEditingController closeNotes = TextEditingController();
  final loading = true.obs;
  CloseSessionModel closeSessionModel = CloseSessionModel();
  CloseSessionController(this.closeSessionUseCase);
  Future<void> closeSession() async {
    final result = await closeSessionUseCase(CloseSessionEntity(
      loading: loading,
      sessionId: openSessionController.openSessionModel.data?.id ?? 0,
      closeCash: closeCash.text,
      closeNotes: closeNotes.text,
    ));
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
        successSnackBar('sessionClosedSuccessfully'.tr);
        closeSessionModel = data;
      },
    );
  }
}
