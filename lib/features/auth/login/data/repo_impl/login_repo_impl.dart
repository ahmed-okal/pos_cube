import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../domain/entitis/login_intity.dart';
import '../../domain/repo/login_repo.dart';
import '../models/login_model.dart';
import '../remote/remote_data_source.dart';

class LoginRepoImpl implements LogInRepo {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, LoginTaskModel>> login(LoginParam loginParam) async {
    try {
      final result = await remoteDataSource.login(loginParam);
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
