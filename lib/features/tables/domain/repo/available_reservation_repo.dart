import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/available_reservation_model.dart';
import '../entities/available_reservation_entity.dart';

abstract class AvailableReservationRepo {
  Future<Either<Failure, AvailableReservationModel>> getAvailableReservation(
      AvailableReservationEntity availableReservationEntity);
}
