import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:point_of_sale/core/errors/failure.dart';

import 'package:point_of_sale/features/home/data/models/order_model.dart';
import 'package:point_of_sale/features/home/data/remote/order_remote_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/order_entity.dart';
import '../../domain/repo/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final OrderRemoteDataSource orderRemoteDataSource;
  OrderRepoImpl(this.orderRemoteDataSource);
  @override
  Future<Either<Failure, OrderModel>> getOrders(OrderParam orderParam) async {
    try {
      final result = await orderRemoteDataSource.getOrders(orderParam);
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
