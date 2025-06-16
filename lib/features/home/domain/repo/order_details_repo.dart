import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/home/data/models/order_details_model.dart';

import '../../../../core/errors/failure.dart';
import '../entitis/order_details_intity.dart';

abstract class OrderDetailsRepo {
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(
      OrderDetailsIntity orderDetailsIntity);
}
