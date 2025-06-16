import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entitis/customers_group_entity.dart';
import '../../domain/repo/customers_group_repo.dart';
import '../models/customer_group_model.dart';
import '../remote/customers_group_remote_data_source.dart';

class CustomersGroupRepoImpl implements CustomersGroupRepo {
  final CustomersGroupRemoteDataSource customersGroupRemoteDataSource;
  CustomersGroupRepoImpl(this.customersGroupRemoteDataSource);

  @override
  Future<Either<Failure, CustomersGroupModel>> getCustomersGroup(
      CustomersGroupEntity customersGroupEntity) async {
    try {
      final result = await customersGroupRemoteDataSource
          .getCustomersGroup(customersGroupEntity);
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
