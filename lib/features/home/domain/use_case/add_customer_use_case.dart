import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/home/data/models/add_customer_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/add_customer_entity.dart';
import 'package:point_of_sale/features/home/domain/repo/add_customer_repo.dart';

class AddCustomerUseCase extends UseCase<AddCustomerModel, AddCustomerEntity> {
  final AddCustomerRepo addCustomerRepo;
  AddCustomerUseCase(this.addCustomerRepo);
  @override
  Future<Either<Failure, AddCustomerModel>> call(AddCustomerEntity params) {
    params.loading(true);
    final result = addCustomerRepo.addCustomer(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
