import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/orders_list_entity.dart';
import '../../domain/repo/orders_list_repo.dart';
import '../models/orders_list_model.dart';
import '../remote/orders_list_remote_data_source.dart';

class OrdersListRepoImpl implements OrdersListRepo {
  final OrdersListRemoteDataSource ordersListRemoteDataSource;
  OrdersListRepoImpl(this.ordersListRemoteDataSource);
  @override
  Future<Either<Failure, OrdersListModel>> getOrders(
      OrdersListEntity ordersListEntity) async {
    try {
      final result =
          await ordersListRemoteDataSource.getOrders(ordersListEntity);
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
