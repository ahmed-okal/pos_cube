import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/use_case.dart';
import '../../data/models/customer_group_model.dart';
import '../entitis/customers_group_entity.dart';
import '../repo/customers_group_repo.dart';

class CustomersGroupUseCase
    extends UseCase<CustomersGroupModel, CustomersGroupEntity> {
  final CustomersGroupRepo customersGroupRepo;
  CustomersGroupUseCase(this.customersGroupRepo);
  @override
  Future<Either<Failure, CustomersGroupModel>> call(
      CustomersGroupEntity params) {
    params.loading(true);
    final result = customersGroupRepo.getCustomersGroup(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
