import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:point_of_sale/core/errors/failure.dart';

import 'package:point_of_sale/features/home/data/models/all_category_model.dart';
import 'package:point_of_sale/features/home/data/remote/all_category_remote_data_source.dart';

import 'package:point_of_sale/features/home/domain/entitis/all_category_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/all_category_repo.dart';

class AllCategoryRepoImpl implements AllCategoryRepo {
  final AllCategoryRemoteDataSource allCategoryRemoteDataSource;
  AllCategoryRepoImpl(this.allCategoryRemoteDataSource);
  @override
  Future<Either<Failure, AllCategoryModel>> getAllCategory(
      AllCategoryEntity allCategoryEntity) async {
    try {
      final result =
          await allCategoryRemoteDataSource.getAllCategory(allCategoryEntity);
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
