import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/available_reservation_entity.dart';
import '../../domain/repo/available_reservation_repo.dart';
import '../models/available_reservation_model.dart';
import '../remote/available_reservation_remote_data_source.dart';

class AvailableReservationRepoImpl implements AvailableReservationRepo {
  AvailableReservationRemoteDataSource availableReservationRemoteDataSource;
  AvailableReservationRepoImpl(this.availableReservationRemoteDataSource);

  @override
  Future<Either<Failure, AvailableReservationModel>> getAvailableReservation(
      AvailableReservationEntity availableReservationEntity) async {
    try {
      final result = await availableReservationRemoteDataSource
          .getAvailableReservation(availableReservationEntity);
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
