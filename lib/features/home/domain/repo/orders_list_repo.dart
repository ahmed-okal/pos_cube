import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/orders_list_model.dart';
import '../entitis/orders_list_entity.dart';

abstract class OrdersListRepo {
  Future<Either<Failure, OrdersListModel>> getOrders(
      OrdersListEntity ordersListEntity);
}
