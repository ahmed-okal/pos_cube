import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/categories_model.dart';

import '../../../../core/services/use_case.dart';
import '../entitis/categories_entity.dart';
import '../repo/categories_repo.dart';

class CategoriesUseCase extends UseCase<CatigoriesTaskModel, CategoriesEntity> {
  final CategoriesRepo categoriesRepo;

  CategoriesUseCase(this.categoriesRepo);
  @override
  Future<Either<Failure, CatigoriesTaskModel>> call(
      CategoriesEntity params) async {
    params.loading(true);
    final result = categoriesRepo.getCategories(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
