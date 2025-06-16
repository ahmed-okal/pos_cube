import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/home/data/models/kitchen_note_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/kitchen_note_entity.dart';
import 'package:point_of_sale/features/home/domain/use_case/kitchen_note_use_case.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class KitchenNoteController extends GetxController {
  final KitchenNoteUseCase kitchenNoteUseCase;
  KitchenNoteController(this.kitchenNoteUseCase);
  final loading = true.obs;
  KitchenNotesModel kitchenNotesModel = KitchenNotesModel();
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  final TextEditingController waitNote = TextEditingController();
  final TextEditingController toServeNote = TextEditingController();
  final TextEditingController emergencyNote = TextEditingController();
  final TextEditingController noDressingNote = TextEditingController();
  final OrderController orderController = Get.find<OrderController>();
  var selectedTabIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedTabIndex.value);
  }

  void onTabChanged(int index) {
    selectedTabIndex.value = index;
    // Check if the PageController has attached clients before animating
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> addKitchenNote(
      String orderId, String orderNo, String kitchenType) async {
    if (waitNote.text.isEmpty &&
        noDressingNote.text.isEmpty &&
        emergencyNote.text.isEmpty &&
        toServeNote.text.isEmpty) {
      failedSnaskBar('enterTheValue'.tr);
    } else {
      final result = await kitchenNoteUseCase(
        KitchenNoteEntity(
          loading: loading,
          orderId: orderId,
          orderNo: orderNo,
          kitchenType: kitchenType,
          kitchenNote: waitNote.text,
          tenantId: cashDataSource.box.read('tenantId'),
          companyId: cashDataSource.box.read('companyId'),
          branchId: cashDataSource.box.read('branchId'),
          userId: cashDataSource.box.read('userId'),
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
          successSnackBar('theNotesAddedSuccessfully'.tr);
          kitchenNotesModel = data;
        },
      );
    }
  }
}
