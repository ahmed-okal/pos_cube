import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/search_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/search_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchModel>> search(SearchEntity searchEntity);
}
