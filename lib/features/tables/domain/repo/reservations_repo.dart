import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/reservations_model.dart';
import '../entities/reservations_entity.dart';

abstract class ReservationsRepo {
  Future<Either<Failure, List<ReservationsModel>>> getReservations(
      ReservationsEntity reservationsEntity);
}
