import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/customer_group_model.dart';
import '../entitis/customers_group_entity.dart';

abstract class CustomersGroupRepo {
  Future<Either<Failure, CustomersGroupModel>> getCustomersGroup(
    CustomersGroupEntity customersGroupEntity,
  );
}
