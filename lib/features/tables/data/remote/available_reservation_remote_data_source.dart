import 'package:dio/dio.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/tables/data/models/available_reservation_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/available_reservation_entity.dart';

abstract class AvailableReservationRemoteDataSource {
  Future<AvailableReservationModel> getAvailableReservation(
      AvailableReservationEntity availableReservationEntity);
}

class AvailableReservationRemoteDataSourceImpl
    extends AvailableReservationRemoteDataSource {
  ApiService apiService;
  AvailableReservationRemoteDataSourceImpl(this.apiService);
  @override
  Future<AvailableReservationModel> getAvailableReservation(
      AvailableReservationEntity availableReservationEntity) async {
    final result = await apiService.postRaw(
      '${Constants.baseUrl}sales/pos/reservation/reservation-available',
      availableReservationEntity.toJson(),
      Options(contentType: Headers.jsonContentType),
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return AvailableReservationModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'getCreateNewOrder failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
