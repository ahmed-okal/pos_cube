import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/categories_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/categories_entity.dart';
import '../../domain/repo/categories_repo.dart';
import '../remote/categories_remote_data_source.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;
  CategoriesRepoImpl(this.categoriesRemoteDataSource);
  @override
  Future<Either<Failure, CatigoriesTaskModel>> getCategories(
      CategoriesEntity categoriesEntity) async {
    try {
      final result =
          await categoriesRemoteDataSource.getCategories(categoriesEntity);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Network error occurred'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
