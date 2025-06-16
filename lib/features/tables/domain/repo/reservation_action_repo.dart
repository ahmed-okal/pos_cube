import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/reservation_action_model.dart';
import '../entities/reservation_action_entity.dart';

abstract class ReservationActionRepo {
  Future<Either<Failure, ReservationActionModel>> reservationAction(
      ReservationActionEntity reservationActionEntity);
}
