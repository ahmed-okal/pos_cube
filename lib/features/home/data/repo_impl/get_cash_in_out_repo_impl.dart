import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entitis/get_cash_in_out_entity.dart';
import '../../domain/repo/get_cash_in_out_repo.dart';
import '../models/get_cash_in_out_model.dart';
import '../remote/get_cash_in_out_remote_data_source.dart';

class GetCashInOutRepoImpl implements GetCashInOutRepo {
  final GetCashInOutRemoteDataSource getCashInOutRemoteDataSource;

  GetCashInOutRepoImpl(this.getCashInOutRemoteDataSource);
  @override
  Future<Either<Failure, GetCashInOutModel>> getCashInOut(
      GetCashInOutEntity getCashInOutEntity) async {
    try {
      final result =
          await getCashInOutRemoteDataSource.getCashInOut(getCashInOutEntity);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Network error occurred'));
    } catch (e) {
      return Left(
        ServerFailure(
          'Unexpected error: ${e.toString()}',
        ),
      );
    }
  }
}
