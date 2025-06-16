import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/tables/data/models/add_new_reservation_model.dart';
import 'package:point_of_sale/features/tables/data/remote/add_new_reservation_remote_data_source.dart';
import 'package:point_of_sale/features/tables/domain/entities/add_new_reservation_entity.dart';
import 'package:point_of_sale/features/tables/domain/repo/add_new_reservation_repo.dart';

import '../../../../core/errors/exceptions.dart';

class AddNewReservationRepoImpl implements AddNewReservationRepo {
  AddNewReservationRemoteDataSource addNewReservationRemoteDataSource;
  AddNewReservationRepoImpl(this.addNewReservationRemoteDataSource);

  @override
  Future<Either<Failure, AddNewReservationModel>> addReservation(
      AddNewReservationEntity addNewReservationEntity) async {
    try {
      final result = await addNewReservationRemoteDataSource
          .addReservation(addNewReservationEntity);
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
