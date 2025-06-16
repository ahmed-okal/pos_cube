import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/tables/data/models/reservation_action_model.dart';
import 'package:point_of_sale/features/tables/domain/entities/reservation_action_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class ReservationActionRemoteDataSource {
  Future<ReservationActionModel> reservationAction(
      ReservationActionEntity reservationActionEntity);
}

class ReservationActionRemoteDataSourceImpl
    extends ReservationActionRemoteDataSource {
  ApiService apiService;
  ReservationActionRemoteDataSourceImpl(this.apiService);
  @override
  Future<ReservationActionModel> reservationAction(
      ReservationActionEntity reservationActionEntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}sales/pos/tables-reservations/${reservationActionEntity.action}/${reservationActionEntity.reservationId}',
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return ReservationActionModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message:
            responseData['message'] ?? 'Failed to perform reservation action',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
