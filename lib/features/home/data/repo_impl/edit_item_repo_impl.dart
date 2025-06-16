import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/remote/edit_item_remote_data_source.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/edit_entity.dart';
import '../../domain/repo/edit_item_repo.dart';
import '../models/delete_item_model.dart';

class EditItemRepoImpl implements EditItemRepo {
  EditItemRemoteDataSource editItemRemoteDataSource;
  EditItemRepoImpl(this.editItemRemoteDataSource);
  @override
  Future<Either<Failure, DeleteItemResponse>> editItem(
      EditEntity editEntity) async {
    try {
      final result = await editItemRemoteDataSource.editItem(editEntity);
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
