import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/payment/data/models/payment_methods_model.dart';
import 'package:point_of_sale/features/payment/data/remote/payment_methods_remote_data_source.dart';
import 'package:point_of_sale/features/payment/domain/intities/payment_methods_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/payment_methods_repo.dart';

class PaymentMethodsRepoImpl implements PaymentMethodsRepo {
  final PaymentMethodsRemoteDataSource paymentMethodsRemoteDataSource;
  PaymentMethodsRepoImpl(this.paymentMethodsRemoteDataSource);
  @override
  Future<Either<Failure, List<PaymentMethodsModel>>> getPaymentMothods(
      PaymentMethodsEntity paymentMothodsEntity) async {
    try {
      final result = await paymentMethodsRemoteDataSource
          .getPaymentMethods(paymentMothodsEntity);
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
