import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/home/data/models/cash_in_out_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/cash_in_out_entity.dart';
import 'package:point_of_sale/features/home/domain/repo/cash_in_out_repo.dart';

class CashInOutUseCase extends UseCase<CashInOutModel, CashInOutEntity> {
  final CashInOutRepo cashInOutRepo;
  CashInOutUseCase(this.cashInOutRepo);
  @override
  Future<Either<Failure, CashInOutModel>> call(CashInOutEntity params) {
    params.loading(true);
    final result = cashInOutRepo.addCashInOut(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
