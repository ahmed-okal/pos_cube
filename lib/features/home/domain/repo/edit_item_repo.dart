import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/delete_item_model.dart';
import '../entitis/edit_entity.dart';

abstract class EditItemRepo {
  Future<Either<Failure, DeleteItemResponse>> editItem(EditEntity editEntity);
}
