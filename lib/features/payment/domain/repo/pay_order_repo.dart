import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/pay_order_model.dart';
import '../intities/pay_order_entity.dart';

abstract class PayOrderRepo {
  Future<Either<Failure, PayOrderModel>> payOrder(PayOrderEntity payOrderParam);
}
