import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/use_case.dart';
import '../../data/models/reservations_model.dart';
import '../entities/reservations_entity.dart';
import '../repo/reservations_repo.dart';

class ReservationsUseCase
    extends UseCase<List<ReservationsModel>, ReservationsEntity> {
  final ReservationsRepo reservationsRepo;
  ReservationsUseCase(this.reservationsRepo);
  @override
  Future<Either<Failure, List<ReservationsModel>>> call(
      ReservationsEntity params) {
    params.loading(true);
    final result = reservationsRepo.getReservations(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
