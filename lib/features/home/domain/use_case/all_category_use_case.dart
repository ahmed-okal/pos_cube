import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/home/data/models/all_category_model.dart';
import 'package:point_of_sale/features/home/domain/repo/all_category_repo.dart';

import '../entitis/all_category_entity.dart';

class AllCategoryUseCase extends UseCase<AllCategoryModel, AllCategoryEntity> {
  final AllCategoryRepo allCategoryRepo;

  AllCategoryUseCase(this.allCategoryRepo);
  @override
  Future<Either<Failure, AllCategoryModel>> call(AllCategoryEntity params) {
    params.loading(true);
    final result = allCategoryRepo.getAllCategory(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
