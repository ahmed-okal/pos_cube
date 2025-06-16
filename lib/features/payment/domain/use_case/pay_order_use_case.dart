import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/payment/domain/repo/pay_order_repo.dart';

import '../../../../core/services/use_case.dart';
import '../../data/models/pay_order_model.dart';
import '../intities/pay_order_entity.dart';

class PayOrderUseCase extends UseCase<PayOrderModel, PayOrderEntity> {
  final PayOrderRepo payOrderRepo;
  PayOrderUseCase(this.payOrderRepo);
  @override
  Future<Either<Failure, PayOrderModel>> call(PayOrderEntity params) {
    params.loading(true);
    final result = payOrderRepo.payOrder(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
