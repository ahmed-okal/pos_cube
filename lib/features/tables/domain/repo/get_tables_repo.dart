import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/tables_model.dart';
import '../entities/get_tables_entity.dart';

abstract class GetTablesRepo {
  Future<Either<Failure, TablesModel>> getTables(
      GetTablesEntity getTablesEntity);
}
