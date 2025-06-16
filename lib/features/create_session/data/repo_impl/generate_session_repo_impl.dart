import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/features/create_session/data/models/generate_session_mosel.dart';
import 'package:point_of_sale/features/create_session/domain/intities/generate_session_intity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repo/generate_session_repo.dart';
import '../remote/generate_session_remote_data_source.dart';

class GenerateSessionRepoImpl implements GenerateSessionRepo {
  final GenerateSessionRemoteDataSource remoteDataSource;
  GenerateSessionRepoImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, GenerateSessionModel>> generateSession(
      GenerateSessionIntity generateSessionIntity) async {
    try {
      final result =
          await remoteDataSource.generateSession(generateSessionIntity);
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
