import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/home/domain/entitis/edit_entity.dart';
import 'package:point_of_sale/features/home/domain/use_case/edit_item_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class EditItemController extends GetxController {
  final EditItemUseCase editItemUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxInt selectedQuantity = 1.obs;

  final TextEditingController qty = TextEditingController();

  final loading = false.obs;
  EditItemController(this.editItemUseCase);
  Future<void> editItem(
    String productId,
    String productName,
    String price,
    String totalPrice,
    int itemId,
  ) async {
    final result = await editItemUseCase(
      EditEntity(
        loading: loading,
        productId: productId,
        productName: productName,
        qty: qty.text,
        price: price,
        totalPrice: totalPrice,
        itemId: itemId,
      ),
    );

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
        successSnackBar('itemUpdatedSuccessfully'.tr);
      },
    );
  }
}
