import 'package:dio/dio.dart';
import 'package:point_of_sale/features/tables/data/models/reservations_model.dart';
import 'package:point_of_sale/features/tables/domain/entities/reservations_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/constants.dart';

abstract class ReservationsRemoteDataSource {
  Future<List<ReservationsModel>> getReservations(
      ReservationsEntity reservationsEntity);
}

class ReservationsRemoteDataSourceImpl extends ReservationsRemoteDataSource {
  ApiService apiService;
  ReservationsRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<ReservationsModel>> getReservations(
      ReservationsEntity reservationsEntity) async {
    try {
      final result = await apiService.postRaw(
        '${Constants.baseUrl}sales/pos/reservation',
        reservationsEntity.toJson(),
        Options(contentType: Headers.jsonContentType),
      );
      final responseData = result.data;
      if (result.statusCode == 200 || result.statusCode == 201) {
        return (responseData as List)
            .map((json) => ReservationsModel.fromJson(json))
            .toList();
      } else {
        throw AppExceptions(
          message: responseData['message'] ??
              'Failed to load available reservations',
          statusCode: result.statusCode,
          data: responseData,
        );
      }
    } on DioException catch (e) {
      throw AppExceptions(
        message: e.response?.data['message'] ??
            'Failed to load available reservations',
        statusCode: e.response?.statusCode,
        data: e.response?.data,
      );
    }
  }
}
