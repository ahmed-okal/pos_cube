import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:point_of_sale/core/errors/failure.dart';

import 'package:point_of_sale/features/home/data/models/search_model.dart';
import 'package:point_of_sale/features/home/data/remote/search_remote_data_source.dart';

import 'package:point_of_sale/features/home/domain/entitis/search_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl(this.searchRemoteDataSource);
  @override
  Future<Either<Failure, SearchModel>> search(SearchEntity searchEntity) async {
    try {
      final result = await searchRemoteDataSource.search(searchEntity);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      String message = 'Network error occurred';
      if (e.response?.data is Map<String, dynamic>) {
        message = e.response?.data['message'] ?? message;
      }
      return Left(ServerFailure(message));
    }
  }
}
