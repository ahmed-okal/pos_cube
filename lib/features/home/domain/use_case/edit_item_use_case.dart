import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/home/domain/entitis/edit_entity.dart';
import 'package:point_of_sale/features/home/domain/repo/edit_item_repo.dart';

import '../../data/models/delete_item_model.dart';

class EditItemUseCase extends UseCase<DeleteItemResponse, EditEntity> {
  final EditItemRepo editItemRepo;

  EditItemUseCase(this.editItemRepo);
  @override
  Future<Either<Failure, DeleteItemResponse>> call(EditEntity params) {
    params.loading(true);
    final result = editItemRepo.editItem(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
