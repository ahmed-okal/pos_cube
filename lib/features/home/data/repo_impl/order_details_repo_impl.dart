import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/remote/order_details_remote_data_source.dart';
import 'package:point_of_sale/features/home/domain/repo/order_details_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/order_details_intity.dart';
import '../models/order_details_model.dart';

class OrderDetailsRepoImpl implements OrderDetailsRepo {
  OrderDetailsRemoteDataSource orderDetailsRemoteDataSource;
  OrderDetailsRepoImpl(this.orderDetailsRemoteDataSource);
  @override
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(
      OrderDetailsIntity orderDetailsIntity) async {
    try {
      final result = await orderDetailsRemoteDataSource
          .getOrderDetails(orderDetailsIntity);
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
