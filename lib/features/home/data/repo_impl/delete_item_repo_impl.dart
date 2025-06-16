import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/remote/delete_item_remote_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/delete_entity.dart';
import '../../domain/repo/delete_item_repo.dart';
import '../models/delete_item_model.dart';

class DeleteItemRepoImpl implements DeleteItemRepo {
  DeleteItemRemoteDataSource deleteItemRemoteDataSource;
  DeleteItemRepoImpl(this.deleteItemRemoteDataSource);
  @override
  Future<Either<Failure, DeleteItemResponse>> deleteItem(
      DeleteEntity deleteEntity) async {
    try {
      final result = await deleteItemRemoteDataSource.deleteItem(deleteEntity);
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
