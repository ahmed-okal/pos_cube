import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/cash_in_out_model.dart';
import 'package:point_of_sale/features/home/data/remote/cash_in_out_remote_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/cash_in_out_entity.dart';
import '../../domain/repo/cash_in_out_repo.dart';

class CashInOutRepoImpl implements CashInOutRepo {
  final CashInOutRemoteDataSource cashInOutRemoteDataSource;

  CashInOutRepoImpl(this.cashInOutRemoteDataSource);
  @override
  Future<Either<Failure, CashInOutModel>> addCashInOut(
      CashInOutEntity cashInOutEntity) async {
    try {
      final result =
          await cashInOutRemoteDataSource.addCashInOut(cashInOutEntity);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Network error occurred'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
