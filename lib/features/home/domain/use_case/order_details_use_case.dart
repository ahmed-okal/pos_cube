import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/domain/repo/order_details_repo.dart';

import '../../../../core/services/use_case.dart';
import '../../data/models/order_details_model.dart';
import '../entitis/order_details_intity.dart';

class OrderDetailsUseCase
    extends UseCase<OrderDetailsModel, OrderDetailsIntity> {
  final OrderDetailsRepo orderDetailsRepo;

  OrderDetailsUseCase(this.orderDetailsRepo);
  @override
  Future<Either<Failure, OrderDetailsModel>> call(
      OrderDetailsIntity params) async {
    params.loading(true);
    final result = orderDetailsRepo.getOrderDetails(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
