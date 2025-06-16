import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/create_session/presentation/getx/controllers/open_session_controller.dart';
import 'package:point_of_sale/features/home/data/models/cash_in_out_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/cash_in_out_entity.dart';
import 'package:point_of_sale/features/home/domain/use_case/cash_in_out_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class CashInOutController extends GetxController {
  final CashInOutUseCase cashInOutUseCase;
  final loading = true.obs;
  CashInOutModel cashInOutModel = CashInOutModel();
  final GlobalKey<FormState> cashInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> cashOutFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> noteInFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> noteOutFormKey = GlobalKey<FormState>();
  final TextEditingController cashIn = TextEditingController();
  final TextEditingController noteIn = TextEditingController();
  final TextEditingController cashOut = TextEditingController();
  final TextEditingController noteOut = TextEditingController();

  CashInOutController(this.cashInOutUseCase);
  final OpenSessionController openSessionController =
      Get.find<OpenSessionController>();
  final CashDataSource cashDataSource = Get.put(CashDataSource());

  var selectedTabIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedTabIndex.value);
  }

  void onTabChanged(int index) {
    selectedTabIndex.value = index;
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> addCashInOut() async {
    final String cashValue =
        selectedTabIndex.value == 0 ? cashIn.text : cashOut.text;
    final String noteValue =
        selectedTabIndex.value == 0 ? noteIn.text : noteOut.text;

    if (cashValue.isEmpty || noteValue.isEmpty) {
      failedSnaskBar('enterTheValue'.tr);
    } else if (cashValue.length > 6) {
      failedSnaskBar('enterTheValue'.tr);
    } else {
      final result = await cashInOutUseCase(
        CashInOutEntity(
          loading: loading,
          cashType: selectedTabIndex.value == 0 ? 'in' : 'out',
          cashAmount: cashValue,
          cashReason: noteValue,
          sessionId:
              openSessionController.openSessionModel.data?.id.toString() ?? '',
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
          successSnackBar('cashAddSuccessfully'.tr);

          cashInOutModel = data;
        },
      );
    }
  }
}
