import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/get_cash_in_out_model.dart';
import '../entitis/get_cash_in_out_entity.dart';

abstract class GetCashInOutRepo {
  Future<Either<Failure, GetCashInOutModel>> getCashInOut(
    GetCashInOutEntity getCashInOutEntity,
  );
}
