import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/create_session/data/models/open_session_model.dart';

import '../../../../core/services/use_case.dart';
import '../intities/open_session_intity.dart';
import '../repo/open_session_repo.dart';

class OpenSessionUseCase extends UseCase<OpenSessionModel, OpenSessionIntity> {
  final OpenSessionRepo openSessionRepo;
  OpenSessionUseCase(this.openSessionRepo);
  @override
  Future<Either<Failure, OpenSessionModel>> call(OpenSessionIntity params) {
    params.loading(true);
    final result = openSessionRepo.openSession(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
