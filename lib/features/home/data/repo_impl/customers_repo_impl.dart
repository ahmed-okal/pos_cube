import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/customers_model.dart';
import 'package:point_of_sale/features/home/data/remote/customers_remote_data_source.dart';
import 'package:point_of_sale/features/home/domain/entitis/customers_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/customers_repo.dart';

class CustomersRepoImpl implements CustomersRepo {
  final CustomersRemoteDataSource customersRemoteDataSource;
  CustomersRepoImpl(this.customersRemoteDataSource);

  @override
  Future<Either<Failure, CustomersModel>> getCustomers(
      CustomersEntity customersEntity) async {
    try {
      final result =
          await customersRemoteDataSource.getCustomers(customersEntity);
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
