import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/home/data/models/customers_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/customers_entity.dart';
import 'package:point_of_sale/features/home/domain/repo/customers_repo.dart';

class CustomersUseCase extends UseCase<CustomersModel, CustomersEntity> {
  final CustomersRepo customersRepo;
  CustomersUseCase(this.customersRepo);
  @override
  Future<Either<Failure, CustomersModel>> call(CustomersEntity params) {
    params.loading(true);
    final result = customersRepo.getCustomers(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
