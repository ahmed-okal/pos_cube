import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/tables/data/models/tables_model.dart';
import 'package:point_of_sale/features/tables/data/remote/get_tables_remote_data_source.dart';
import 'package:point_of_sale/features/tables/domain/entities/get_tables_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/repo/get_tables_repo.dart';

class GetTablesRepoImpl implements GetTablesRepo {
  GetTablesRemoteDataSource getTablesRemoteDataSource;
  GetTablesRepoImpl(this.getTablesRemoteDataSource);

  @override
  Future<Either<Failure, TablesModel>> getTables(
      GetTablesEntity getTablesEntity) async {
    try {
      final result = await getTablesRemoteDataSource.getTables(getTablesEntity);
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
