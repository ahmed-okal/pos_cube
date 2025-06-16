import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/tables/data/models/add_new_reservation_model.dart';
import 'package:point_of_sale/features/tables/domain/entities/add_new_reservation_entity.dart';
import 'package:point_of_sale/features/tables/domain/use_case/add_new_reservation_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class AddNewReservationController extends GetxController {
  AddNewReservationModel addNewReservationModel = AddNewReservationModel();
  final loading = true.obs;
  final TextEditingController noOfGusts = TextEditingController();
  final TextEditingController customerName = TextEditingController();
  final CashDataSource cashDataSource = Get.find<CashDataSource>();
  final AddNewReservationUseCase addNewReservationUseCase;
  final formKey = GlobalKey<FormState>();

  AddNewReservationController(this.addNewReservationUseCase);

  Future<void> addReservation({
    required int tableId,
    required String tableCode,
    required String startTime,
    required String endTime,
    required String simpleDate,
  }) async {
    final result = await addNewReservationUseCase(
      AddNewReservationEntity(
        loading: loading,
        tableId: tableId,
        tableCode: tableCode.trim(),
        noOfGusts: int.parse(noOfGusts.text),
        customerId: 0,
        customerName: customerName.text,
        reservationStart: startTime,
        reservationEnd: endTime,
        reservationDate: simpleDate,
        tenantId: cashDataSource.box.read('tenantId'),
        companyId: cashDataSource.box.read('companyId'),
        branchId: cashDataSource.box.read('branchId'),
        createdBy: cashDataSource.box.read('userId'),
      ),
    );

    result.fold(
      (failure) {
        failedSnaskBar(failure is ServerFailure
            ? failure.message
            : failure is AppExceptions
                ? failure.message
                : 'somethingWentWrongPleaseTryAgainLater'.tr);
      },
      (data) {
        // Only truly successful reservations get here
        successSnackBar('reservationAddedSuccessfully.tr');
        addNewReservationModel = data;
      },
    );
  }
}
