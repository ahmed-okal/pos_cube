import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/order_model.dart';
import '../entitis/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, OrderModel>> getOrders(OrderParam orderParam);
}
