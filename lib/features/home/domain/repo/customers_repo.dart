import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/home/data/models/customers_model.dart';

import '../../../../core/errors/failure.dart';
import '../entitis/customers_entity.dart';

abstract class CustomersRepo {
  Future<Either<Failure, CustomersModel>> getCustomers(
    CustomersEntity customersEntity,
  );
}
