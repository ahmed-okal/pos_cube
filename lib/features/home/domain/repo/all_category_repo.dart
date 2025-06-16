import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/all_category_model.dart';
import '../entitis/all_category_entity.dart';

abstract class AllCategoryRepo {
  Future<Either<Failure, AllCategoryModel>> getAllCategory(
      AllCategoryEntity allCategoryEntity);
}
