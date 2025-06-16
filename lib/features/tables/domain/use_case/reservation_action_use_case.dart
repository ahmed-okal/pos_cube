import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/tables/data/models/reservation_action_model.dart';
import 'package:point_of_sale/features/tables/domain/entities/reservation_action_entity.dart';
import 'package:point_of_sale/features/tables/domain/repo/reservation_action_repo.dart';

class ReservationActionUseCase
    extends UseCase<ReservationActionModel, ReservationActionEntity> {
  final ReservationActionRepo reservationActionRepo;
  ReservationActionUseCase(this.reservationActionRepo);
  @override
  Future<Either<Failure, ReservationActionModel>> call(
      ReservationActionEntity params) {
    params.loading(true);
    final result = reservationActionRepo.reservationAction(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
