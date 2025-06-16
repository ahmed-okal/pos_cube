import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/payment/data/models/pay_order_model.dart';
import 'package:point_of_sale/features/payment/data/remote/pay_order_remote_data_source.dart';
import 'package:point_of_sale/features/payment/domain/intities/pay_order_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/pay_order_repo.dart';

class PayOrderRepoImpl implements PayOrderRepo {
  final PayOrderRemoteDataSource payOrderRemoteDataSource;
  PayOrderRepoImpl(this.payOrderRemoteDataSource);
  @override
  Future<Either<Failure, PayOrderModel>> payOrder(
      PayOrderEntity payOrderParam) async {
    try {
      final result = await payOrderRemoteDataSource.payOrder(payOrderParam);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      String message = 'Network error occurred';
      if (e.response?.data is Map<String, dynamic>) {
        message = e.response?.data['message'] ?? message;
      }
      return Left(ServerFailure(message));
    }
  }
}
