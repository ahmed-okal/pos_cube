import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/services/use_case.dart';
import 'package:point_of_sale/features/home/data/models/kitchen_note_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/kitchen_note_entity.dart';
import 'package:point_of_sale/features/home/domain/repo/kitchen_note_repo.dart';

class KitchenNoteUseCase extends UseCase<KitchenNotesModel, KitchenNoteEntity> {
  final KitchenNoteRepo kitchenNoteRepo;
  KitchenNoteUseCase(this.kitchenNoteRepo);
  @override
  Future<Either<Failure, KitchenNotesModel>> call(KitchenNoteEntity params) {
    params.loading(true);
    final result = kitchenNoteRepo.addKitchenNote(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
