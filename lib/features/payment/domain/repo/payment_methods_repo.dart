import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/payment/data/models/payment_methods_model.dart';
import 'package:point_of_sale/features/payment/domain/intities/payment_methods_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class PaymentMethodsRepo {
  Future<Either<Failure, List<PaymentMethodsModel>>> getPaymentMothods(
      PaymentMethodsEntity paymentMothodsEntity);
}
