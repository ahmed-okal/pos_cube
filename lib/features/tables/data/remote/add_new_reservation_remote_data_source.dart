import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/tables/data/models/add_new_reservation_model.dart';
import 'package:point_of_sale/features/tables/domain/entities/add_new_reservation_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class AddNewReservationRemoteDataSource {
  Future<AddNewReservationModel> addReservation(
      AddNewReservationEntity addNewReservationEntity);
}

class AddNewReservationRemoteDataSourceImpl
    implements AddNewReservationRemoteDataSource {
  ApiService apiService;
  AddNewReservationRemoteDataSourceImpl(this.apiService);

  @override
  Future<AddNewReservationModel> addReservation(
      AddNewReservationEntity addNewReservationEntity) async {
    final result = await apiService.postRaw(
      '${Constants.baseUrl}sales/pos/reservation/new',
      addNewReservationEntity.toJson(),
      Options(contentType: Headers.jsonContentType),
    );
    final responseData = result.data as Map<String, dynamic>;
    final status = result.statusCode;

    if (status == 200 || status == 201) {
      // Normalize the message for comparison
      final message =
          (responseData['message'] as String?)?.trim().toLowerCase();

      if (message == 'this slot is out of range') {
        // failedSnaskBar('This slot is out of range');
        throw AppExceptions(
          message: 'thisSlotIsOutOfRange'.tr,
          statusCode: status,
          data: responseData,
        );
      }

      // ← NEW: handle "slot is reserved"
      if (message == 'this slot is reserved') {
        // failedSnaskBar('This slot is reserved');
        throw AppExceptions(
          message: 'This slot is reserved',
          statusCode: status,
          data: responseData,
        );
      }

      return AddNewReservationModel.fromJson(responseData);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'failed',
        statusCode: status,
        data: responseData,
      );
    }
  }
}
