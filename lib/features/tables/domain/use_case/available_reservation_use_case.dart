import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/use_case.dart';
import '../../data/models/available_reservation_model.dart';
import '../entities/available_reservation_entity.dart';
import '../repo/available_reservation_repo.dart';

class AvailableReservationUseCase
    extends UseCase<AvailableReservationModel, AvailableReservationEntity> {
  final AvailableReservationRepo availableReservationRepo;

  AvailableReservationUseCase(this.availableReservationRepo);

  @override
  Future<Either<Failure, AvailableReservationModel>> call(
      AvailableReservationEntity params) {
    params.loading(true);
    final result = availableReservationRepo.getAvailableReservation(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
