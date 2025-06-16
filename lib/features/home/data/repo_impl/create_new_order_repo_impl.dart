import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/create_new_order_model.dart';
import 'package:point_of_sale/features/home/data/remote/create_new_order_remote_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/create_new_order_entity.dart';
import '../../domain/repo/create_new_order_repo.dart';

class CreateNewOrderRepoImpl implements CreateNewOrderRepo {
  final CreateNewOrderRemoteDataSource createNewOrderRemoteDataSource;
  CreateNewOrderRepoImpl(this.createNewOrderRemoteDataSource);
  @override
  Future<Either<Failure, CreateNewOrderModel>> getCreateNewOrder(
      CreateNewOrderEntity createNewOrderIntity) async {
    try {
      final result = await createNewOrderRemoteDataSource
          .getCreateNewOrder(createNewOrderIntity);
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
