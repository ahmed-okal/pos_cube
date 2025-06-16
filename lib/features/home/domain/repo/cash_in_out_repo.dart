import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/home/data/models/cash_in_out_model.dart';

import '../../../../core/errors/failure.dart';
import '../entitis/cash_in_out_entity.dart';

abstract class CashInOutRepo {
  Future<Either<Failure, CashInOutModel>> addCashInOut(
    CashInOutEntity cashInOutEntity,
  );
}
