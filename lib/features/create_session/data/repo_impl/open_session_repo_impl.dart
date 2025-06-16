import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:point_of_sale/core/errors/failure.dart';

import 'package:point_of_sale/features/create_session/data/models/open_session_model.dart';

import 'package:point_of_sale/features/create_session/domain/intities/open_session_intity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/open_session_repo.dart';
import '../remote/open_session_remote_data_source.dart';

class OpenSessionRepoImpl implements OpenSessionRepo {
  final OpenSessionRemoteDataSource openSessionRemoteDataSource;
  OpenSessionRepoImpl(this.openSessionRemoteDataSource);
  @override
  Future<Either<Failure, OpenSessionModel>> openSession(
      OpenSessionIntity openSessionIntity) async {
    try {
      final result =
          await openSessionRemoteDataSource.openSession(openSessionIntity);
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
