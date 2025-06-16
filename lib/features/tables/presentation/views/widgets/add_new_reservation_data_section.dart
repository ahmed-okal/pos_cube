import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/available_reservation_controller.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/add_new_reservation_controller.dart';
import '../../getx/controllers/add_new_reservation_date_picker_controller.dart';
import '../../getx/controllers/time_picker_controller.dart';
import 'add_new_reservation_data.dart';

class AddNewReservationDataSection extends StatelessWidget {
  const AddNewReservationDataSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final availableController = Get.find<AvailableReservationController>();
    final addNewController = Get.find<AddNewReservationController>();
    final datePickerController =
        Get.find<AddNewReservationDatePickerController>();
    final timePickerController = Get.find<TimePickerController>();

    return Form(
      key: addNewController.formKey,
      child: Row(
        spacing: AppSize.width(14),
        children: [
          AddNewReservationData(
            hintText: 'enterTheCountOfGuests'.tr,
            autofocus: true,
            onChange: (value) {
              availableController.getAvailableReservation(
                numOfGuests: addNewController.noOfGusts.text,
                isoDateOnly: datePickerController.isoDateOnly,
                formattedStartTime24: timePickerController.formattedStartTime24,
              );
            },
            textAlign: TextAlign.center,
            maxLength: 2,
            width: AppSize.width(100),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            data: 'guest'.tr,
            textEditingController: addNewController.noOfGusts,
          ),
          AddNewReservationData(
            width: AppSize.width(237),
            data: 'name'.tr,
            hintText: '',
            textEditingController: addNewController.customerName,
          ),
        ],
      ),
    );
  }
}
