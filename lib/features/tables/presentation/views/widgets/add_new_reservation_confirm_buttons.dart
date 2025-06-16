import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/failed_snack_bar.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/reservations_controller.dart';

import '../../../../../core/widgets/confirm_and_cancel_buttons.dart';
import '../../getx/controllers/add_new_reservation_controller.dart';
import '../../getx/controllers/add_new_reservation_date_picker_controller.dart';
import '../../getx/controllers/available_reservation_controller.dart';
import '../../getx/controllers/time_picker_controller.dart';

class AddNewReservationConfirmButtons extends StatelessWidget {
  const AddNewReservationConfirmButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reservationsController = Get.find<ReservationsController>();
    final addNewController = Get.find<AddNewReservationController>();
    final availableController = Get.find<AvailableReservationController>();
    final datePickerController =
        Get.find<AddNewReservationDatePickerController>();
    Get.find<TimePickerController>();

    return ConfirmAndCancelButtons(
      confirmTap: () {
        if (!addNewController.formKey.currentState!.validate()) {
          return;
        }

        if (availableController.selectedTimeSlot.value == (-1)) {
          failedSnaskBar('selectTimeSlot'.tr);
        } else {
          final selectedIndex =
              availableController.selectedAvailableReservation.value;
          final selectedTable = availableController
              .availableReservationModels.data?[selectedIndex].tableDetails;
          addNewController.addReservation(
            tableId: selectedTable?.id ?? 0,
            tableCode: selectedTable?.tableCode ?? '',
            startTime: availableController
                    .availableReservationModels
                    .data?[
                        availableController.selectedAvailableReservation.value]
                    .slots?[availableController.selectedTimeSlot.value]
                    .slotStartTime ??
                '',
            endTime: availableController
                    .availableReservationModels
                    .data?[
                        availableController.selectedAvailableReservation.value]
                    .slots?[availableController.selectedTimeSlot.value]
                    .slotEndTime ??
                '',
            simpleDate: datePickerController.simpleDate,
          );
          Get.back();
          reservationsController.getReservations();
          addNewController.noOfGusts.clear();
          addNewController.customerName.clear();
        }
      },
      cancelTap: () {
        Get.back();
      },
    );
  }
}
