import 'package:dartz/dartz.dart';

import 'package:point_of_sale/core/errors/failure.dart';

import '../../../../core/services/use_case.dart';
import '../../data/models/generate_session_mosel.dart';
import '../intities/generate_session_intity.dart';
import '../repo/generate_session_repo.dart';

class GenerateSessionUseCase
    extends UseCase<GenerateSessionModel, GenerateSessionIntity> {
  final GenerateSessionRepo generateSessionRepo;
  GenerateSessionUseCase(this.generateSessionRepo);
  @override
  Future<Either<Failure, GenerateSessionModel>> call(
      GenerateSessionIntity params) async {
    params.loading(true);
    final result = generateSessionRepo.generateSession(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
