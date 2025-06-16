import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/home/data/models/create_new_order_model.dart';

import '../../../../core/errors/failure.dart';
import '../entitis/create_new_order_entity.dart';

abstract class CreateNewOrderRepo {
  Future<Either<Failure, CreateNewOrderModel>> getCreateNewOrder(
      CreateNewOrderEntity createNewOrderIntity);
}
