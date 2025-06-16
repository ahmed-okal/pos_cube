import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/home/data/models/close_session_model.dart';
import 'package:point_of_sale/features/home/domain/repo/close_session_repo.dart';

import '../entitis/close_session_entity.dart';

class CloseSessionUseCase
    extends UseCase<CloseSessionModel, CloseSessionEntity> {
  final CloseSessionRepo closeSessionRepo;

  CloseSessionUseCase(this.closeSessionRepo);
  @override
  Future<Either<Failure, CloseSessionModel>> call(
      CloseSessionEntity params) async {
    params.loading(true);
    final result = closeSessionRepo.closeSession(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
