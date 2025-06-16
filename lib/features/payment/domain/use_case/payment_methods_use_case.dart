import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/payment/data/models/payment_methods_model.dart';
import 'package:point_of_sale/features/payment/domain/intities/payment_methods_entity.dart';
import 'package:point_of_sale/features/payment/domain/repo/payment_methods_repo.dart';

class PaymentMethodsUseCase
    extends UseCase<List<PaymentMethodsModel>, PaymentMethodsEntity> {
  final PaymentMethodsRepo paymentMethodsRepo;
  PaymentMethodsUseCase(this.paymentMethodsRepo);
  @override
  Future<Either<Failure, List<PaymentMethodsModel>>> call(
      PaymentMethodsEntity params) {
    params.loading(true);
    final result = paymentMethodsRepo.getPaymentMothods(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
