import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/tables/domain/entities/reservation_action_entity.dart';
import 'package:point_of_sale/features/tables/domain/use_case/reservation_action_use_case.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/reservations_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../data/models/reservation_action_model.dart';

class CancelReservationController extends GetxController {
  final loading = true.obs;
  final ReservationsController reservationsController =
      Get.find<ReservationsController>();
  final ReservationActionUseCase reservationActionUseCase;
  ReservationActionModel reservationActionModel = ReservationActionModel();
  CancelReservationController(this.reservationActionUseCase);
  Future<void> cancelReservation(int reservationId) async {
    final result = await reservationActionUseCase(
      ReservationActionEntity(
        loading: loading,
        reservationId: reservationId,
        action: 'cancel',
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
        data = reservationActionModel;
        successSnackBar('reservationCanceledSuccessfully'.tr);
        reservationsController.getReservations();
      },
    );
  }
}
