import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/kitchen_note_model.dart';
import 'package:point_of_sale/features/home/data/remote/kitchen_note_remote_data_source.dart';
import 'package:point_of_sale/features/home/domain/repo/kitchen_note_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/kitchen_note_entity.dart';

class KitchenNoteRepoImpl implements KitchenNoteRepo {
  final KitchenNoteRemoteDataSource kitchenNoteRemoteDataSource;

  KitchenNoteRepoImpl(this.kitchenNoteRemoteDataSource);
  @override
  Future<Either<Failure, KitchenNotesModel>> addKitchenNote(
      KitchenNoteEntity kitchenNoteEntity) async {
    try {
      final result =
          await kitchenNoteRemoteDataSource.addKitchenNote(kitchenNoteEntity);
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
