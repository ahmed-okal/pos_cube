import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/home/data/models/add_customer_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/add_customer_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class AddCustomerRepo {
  Future<Either<Failure, AddCustomerModel>> addCustomer(
    AddCustomerEntity addCustomerEntity,
  );
}
