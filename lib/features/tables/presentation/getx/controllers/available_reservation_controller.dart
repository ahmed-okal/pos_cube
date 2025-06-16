import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../data/models/available_reservation_model.dart';
import '../../../domain/entities/available_reservation_entity.dart';
import '../../../domain/use_case/available_reservation_use_case.dart';

class AvailableReservationController extends GetxController {
  String getTableImage(int? noOfSeats, int? status) {
    // Default to empty table image if no seats or status provided
    if (noOfSeats == null || status == null) {
      return tableImages[6]; // Default to 2-seat empty table
    }

    // Calculate base index based on number of seats
    final int baseIndex = switch (noOfSeats) {
      2 => 0,
      4 => 1,
      6 => 2,
      8 => 3,
      10 => 4,
      12 => 5,
      _ => 0, // Default to 2-seat table if unknown size
    };

    // Calculate offset based on status
    final int statusOffset = switch (status) {
      1 => 6, // Empty tables start at index 6
      2 => 0, // Busy tables start at index 0
      3 => 12, // Reserved tables start at index 12
      _ => 6, // Default to empty table if unknown status
    };

    // Return the appropriate image
    return tableImages[baseIndex + statusOffset];
  }

  final List<String> tableImages = [
    'assets/images/table2busy.png', //0  busy
    'assets/images/table4busy.png', //1
    'assets/images/table6busy.png', //2
    'assets/images/table8busy.png', //3
    'assets/images/table10busy.png', //4
    'assets/images/table12busy.png', //5
    'assets/images/table2empty.png', //6  empty
    'assets/images/table4empty.png', //7
    'assets/images/table6empty.png', //8
    'assets/images/table8empty.png', //9
    'assets/images/table10empty.png', //10
    'assets/images/table12empty.png', //11
    'assets/images/table2reserved.png', //12  reserved
    'assets/images/table4reserved.png', //13
    'assets/images/table6reserved.png', //14
    'assets/images/table8reserved.png', //15
    'assets/images/table10reserved.png', //16
    'assets/images/table12reserved.png', //17
  ];
  final loading = false.obs;
  final AvailableReservationUseCase availableReservationUseCase;

  AvailableReservationController(this.availableReservationUseCase);

  AvailableReservationModel availableReservationModels =
      AvailableReservationModel();
  final RxInt selectedAvailableReservation = (0).obs;
  final RxInt selectedTimeSlot = (-1).obs;
  late final PageController pageController;
  final RxInt selectedPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  void setSelectedTimeSlot(int index) {
    if (selectedTimeSlot.value == index) {
      selectedTimeSlot.value = -1;
    } else {
      selectedTimeSlot.value = index;
    }
  }

  void setSelectedAvailableReservation(int index) {
    selectedTimeSlot.value = -1; // Reset time slot selection
    selectedAvailableReservation.value = index;
    selectedPage.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> getAvailableReservation(
      {required String numOfGuests,
      required String isoDateOnly,
      required String formattedStartTime24}) async {
    if (numOfGuests.isEmpty ||
        int.tryParse(numOfGuests) == null ||
        int.parse(numOfGuests) <= 0) {
      // availableReservationModels = [];
      loading.value = false;
      return;
    }

    loading.value = true;
    final result = await availableReservationUseCase(
      AvailableReservationEntity(
        loading: loading,
        seatsNo: numOfGuests,
        reservationDate: "$isoDateOnly $formattedStartTime24",
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
        // availableReservationModels = [];
      },
      (data) {
        selectedAvailableReservation.value = 0;
        selectedTimeSlot.value = -1;
        availableReservationModels = data;
      },
    );
  }
}
