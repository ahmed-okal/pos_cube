import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/features/home/data/models/price_list_model.dart';
import 'package:point_of_sale/features/home/data/remote/price_list_remote_data_source.dart';
import 'package:point_of_sale/features/home/domain/repo/price_list_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entitis/price_list_entity.dart';

class PriceListRepoImpl implements PriceListRepo {
  final PriceListRemoteDataSource priceListRemoteDataSource;

  PriceListRepoImpl(this.priceListRemoteDataSource);
  @override
  Future<Either<Failure, PriceListModel>> getPriceList(
      PriceListEntity priceListEntity) async {
    try {
      final result =
          await priceListRemoteDataSource.getPriceList(priceListEntity);
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
