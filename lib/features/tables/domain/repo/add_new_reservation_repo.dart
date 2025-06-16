import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/tables/data/models/add_new_reservation_model.dart';
import 'package:point_of_sale/features/tables/domain/entities/add_new_reservation_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class AddNewReservationRepo {
  Future<Either<Failure, AddNewReservationModel>> addReservation(
      AddNewReservationEntity addNewReservationEntity);
}
