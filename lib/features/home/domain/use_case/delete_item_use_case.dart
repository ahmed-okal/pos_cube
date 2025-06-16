import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/home/domain/repo/delete_item_repo.dart';

import '../../data/models/delete_item_model.dart';
import '../entitis/delete_entity.dart';

class DeleteItemUseCase extends UseCase<DeleteItemResponse, DeleteEntity> {
  final DeleteItemRepo deleteItemRepo;

  DeleteItemUseCase(this.deleteItemRepo);
  @override
  Future<Either<Failure, DeleteItemResponse>> call(DeleteEntity params) {
    params.loading(true);
    final result = deleteItemRepo.deleteItem(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
