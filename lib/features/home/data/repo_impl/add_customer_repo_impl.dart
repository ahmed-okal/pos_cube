import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/add_customer_model.dart';
import 'package:point_of_sale/features/home/data/remote/add_customer_remote_data_source.dart';
import 'package:point_of_sale/features/home/domain/entitis/add_customer_entity.dart';
import 'package:point_of_sale/features/home/domain/repo/add_customer_repo.dart';

import '../../../../core/errors/exceptions.dart';

class AddCustomerRepoImpl implements AddCustomerRepo {
  final AddCustomerRemoteDataSource addCustomerRemoteDataSource;

  AddCustomerRepoImpl(this.addCustomerRemoteDataSource);
  @override
  Future<Either<Failure, AddCustomerModel>> addCustomer(
      AddCustomerEntity addCustomerEntity) async {
    try {
      final result =
          await addCustomerRemoteDataSource.addCustomer(addCustomerEntity);
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
