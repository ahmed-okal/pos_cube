import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/delete_item_model.dart';
import '../entitis/delete_entity.dart';

abstract class DeleteItemRepo {
  Future<Either<Failure, DeleteItemResponse>> deleteItem(
      DeleteEntity deleteEntity);
}
