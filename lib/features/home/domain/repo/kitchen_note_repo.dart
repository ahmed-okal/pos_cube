import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/home/data/models/kitchen_note_model.dart';

import '../../../../core/errors/failure.dart';
import '../entitis/kitchen_note_entity.dart';

abstract class KitchenNoteRepo {
  Future<Either<Failure, KitchenNotesModel>> addKitchenNote(
    KitchenNoteEntity kitchenNoteEntity,
  );
}
