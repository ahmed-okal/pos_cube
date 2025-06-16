import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';

import '../../../../core/services/use_case.dart';
import '../../data/models/orders_list_model.dart';
import '../entitis/orders_list_entity.dart';
import '../repo/orders_list_repo.dart';

class OrdersListUseCase extends UseCase<OrdersListModel, OrdersListEntity> {
  final OrdersListRepo ordersListRepo;
  OrdersListUseCase(this.ordersListRepo);
  @override
  Future<Either<Failure, OrdersListModel>> call(OrdersListEntity params) {
    params.loading(true);
    final result = ordersListRepo.getOrders(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
