import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/create_new_order_model.dart';
import 'package:point_of_sale/features/home/domain/repo/create_new_order_repo.dart';

import '../../../../core/services/use_case.dart';
import '../entitis/create_new_order_entity.dart';

class CreateNewOrderUseCase
    extends UseCase<CreateNewOrderModel, CreateNewOrderEntity> {
  final CreateNewOrderRepo createNewOrderRepo;
  CreateNewOrderUseCase(this.createNewOrderRepo);
  @override
  Future<Either<Failure, CreateNewOrderModel>> call(
      CreateNewOrderEntity params) {
    params.loading(true);
    final result = createNewOrderRepo.getCreateNewOrder(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
