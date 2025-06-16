import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/order_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/order_entity.dart';
import 'package:point_of_sale/features/home/domain/repo/order_repo.dart';

import '../../../../core/services/use_case.dart';

class OrderUseCase extends UseCase<OrderModel, OrderParam> {
  final OrderRepo orderRepo;
  OrderUseCase(this.orderRepo);
  @override
  Future<Either<Failure, OrderModel>> call(OrderParam params) {
    params.loading(true);
    final result = orderRepo.getOrders(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
