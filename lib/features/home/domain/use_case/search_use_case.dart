import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/home/data/models/search_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/search_entity.dart';
import 'package:point_of_sale/features/home/domain/repo/search_repo.dart';

class SearchUseCase extends UseCase<SearchModel, SearchEntity> {
  final SearchRepo searchRepo;
  SearchUseCase(this.searchRepo);
  @override
  Future<Either<Failure, SearchModel>> call(SearchEntity params) {
    params.loading(true);
    final result = searchRepo.search(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
