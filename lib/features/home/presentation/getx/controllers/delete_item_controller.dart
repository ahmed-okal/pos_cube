import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/home/domain/entitis/delete_entity.dart';
import 'package:point_of_sale/features/home/domain/use_case/delete_item_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class DeleteItemController extends GetxController {
  final DeleteItemUseCase deleteItemUseCase;
  final loading = false.obs;

  DeleteItemController(this.deleteItemUseCase);

  Future<void> deleteItem(int itemId) async {
    final result =
        await deleteItemUseCase(DeleteEntity(loading: loading, itemId: itemId));

    result.fold(
      (failure) {
        String errorMessage;
        if (failure is ServerFailure) {
          errorMessage = failure.message;
        } else if (failure is AppExceptions) {
          errorMessage = failure.message;
        } else {
          errorMessage = 'somethingWentWrongPleaseTryAgainLater'.tr;
        }

        failedSnaskBar(errorMessage);
      },
      (data) {
        successSnackBar('itemDeletedSuccessfully'.tr);
      },
    );
  }
}
