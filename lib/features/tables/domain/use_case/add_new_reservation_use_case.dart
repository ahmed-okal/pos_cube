import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/tables/data/models/add_new_reservation_model.dart';
import 'package:point_of_sale/features/tables/domain/entities/add_new_reservation_entity.dart';
import 'package:point_of_sale/features/tables/domain/repo/add_new_reservation_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/use_case.dart';

class AddNewReservationUseCase
    extends UseCase<AddNewReservationModel, AddNewReservationEntity> {
  final AddNewReservationRepo addNewReservationRepo;
  AddNewReservationUseCase(this.addNewReservationRepo);
  @override
  Future<Either<Failure, AddNewReservationModel>> call(
      AddNewReservationEntity params) {
    params.loading(true);
    final result = addNewReservationRepo.addReservation(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
