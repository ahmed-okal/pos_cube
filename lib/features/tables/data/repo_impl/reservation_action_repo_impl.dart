import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/reservation_action_entity.dart';
import '../../domain/repo/reservation_action_repo.dart';
import '../models/reservation_action_model.dart';
import '../remote/reservation_action_remote_data_source.dart';

class ReservationActionRepoImpl implements ReservationActionRepo {
  ReservationActionRemoteDataSource reservationActionRemoteDataSource;
  ReservationActionRepoImpl(this.reservationActionRemoteDataSource);

  @override
  Future<Either<Failure, ReservationActionModel>> reservationAction(
      ReservationActionEntity reservationActionEntity) async {
    try {
      final result = await reservationActionRemoteDataSource
          .reservationAction(reservationActionEntity);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      String message = 'Network error occurred';
      if (e.response?.data is Map<String, dynamic>) {
        message = e.response?.data['message'] ?? message;
      }
      return Left(ServerFailure(message));
    }
  }
}
