import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/reservations_entity.dart';
import '../../domain/repo/reservations_repo.dart';
import '../models/reservations_model.dart';
import '../remote/reservations_remote_data_source.dart';

class ReservationsRepoImpl implements ReservationsRepo {
  ReservationsRemoteDataSource reservationsRemoteDataSource;
  ReservationsRepoImpl(this.reservationsRemoteDataSource);

  @override
  Future<Either<Failure, List<ReservationsModel>>> getReservations(
      ReservationsEntity reservationsEntity) async {
    try {
      final result = await reservationsRemoteDataSource
          .getReservations(reservationsEntity);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        return Left(ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data));
      }
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure('generalError'.tr));
    }
  }
}
