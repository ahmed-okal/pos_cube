import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/tables/data/models/tables_model.dart';
import 'package:point_of_sale/features/tables/domain/entities/get_tables_entity.dart';
import 'package:point_of_sale/features/tables/domain/repo/get_tables_repo.dart';

import '../../../../core/services/use_case.dart';

class GetTablesUseCase extends UseCase<TablesModel, GetTablesEntity> {
  final GetTablesRepo getTablesRepo;
  GetTablesUseCase(this.getTablesRepo);
  @override
  Future<Either<Failure, TablesModel>> call(GetTablesEntity params) {
    params.loading(true);
    final result = getTablesRepo.getTables(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
