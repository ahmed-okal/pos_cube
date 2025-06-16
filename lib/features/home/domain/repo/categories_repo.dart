import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/categories_model.dart';
import '../entitis/categories_entity.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, CatigoriesTaskModel>> getCategories(
      CategoriesEntity categoriesEntity);
}
