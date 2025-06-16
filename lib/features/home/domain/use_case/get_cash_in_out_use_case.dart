import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/use_case.dart';
import '../../data/models/get_cash_in_out_model.dart';
import '../entitis/get_cash_in_out_entity.dart';
import '../repo/get_cash_in_out_repo.dart';

class GetCashInOutUseCase
    extends UseCase<GetCashInOutModel, GetCashInOutEntity> {
  final GetCashInOutRepo getCashInOutRepo;
  GetCashInOutUseCase(this.getCashInOutRepo);
  @override
  Future<Either<Failure, GetCashInOutModel>> call(GetCashInOutEntity params) {
    params.loading(true);
    final result = getCashInOutRepo.getCashInOut(params);
    result.then(
      (value) {
        params.loading(false);
      },
    );
    return result;
  }
}
