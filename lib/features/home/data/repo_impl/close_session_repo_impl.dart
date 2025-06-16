import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/home/data/models/close_session_model.dart';
import 'package:point_of_sale/features/home/data/remote/close_session_remote_data_source.dart';
import 'package:point_of_sale/features/home/domain/entitis/close_session_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/close_session_repo.dart';

class CloseSessionRepoImpl implements CloseSessionRepo {
  final CloseSessionRemoteDataSource closeSessionRemoteDataSource;

  CloseSessionRepoImpl(this.closeSessionRemoteDataSource);
  @override
  Future<Either<Failure, CloseSessionModel>> closeSession(
      CloseSessionEntity closeSessionIntity) async {
    try {
      final result =
          await closeSessionRemoteDataSource.closeSession(closeSessionIntity);
      return Right(result);
    } on AppExceptions catch (e) {
      return Left(ServerFailure(e.message));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Network error occurred'));
    } catch (e) {
      return Left(
        ServerFailure(
          'Unexpected error: ${e.toString()}',
        ),
      );
    }
  }
}
