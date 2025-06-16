import 'package:get/get.dart';
import 'package:point_of_sale/features/home/data/models/price_list_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/price_list_entity.dart';
import 'package:point_of_sale/features/home/domain/use_case/price_list_use_case.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/customers_group_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class PriceListController extends GetxController {
  final PriceListUseCase priceListUseCase;
  final loading = true.obs;
  PriceListModel priceListModel = PriceListModel();
  final CustomersGroupController customersGroupController =
      Get.find<CustomersGroupController>();
  PriceListController(this.priceListUseCase);

  final CashDataSource cashDataSource = Get.put(CashDataSource());
  final selectedPriceList = RxnString();
  void changePriceList(String? priceListId) {
    if (priceListId != null) selectedPriceList.value = priceListId;
  }

  @override
  void onInit() {
    super.onInit();
    getPriceList();
  }

  Future<void> getPriceList() async {
    final result = await priceListUseCase(
      PriceListEntity(
        loading: loading,
        tenantId: cashDataSource.box.read('tenantId'),
        companyId: cashDataSource.box.read('companyId'),
        branchId: cashDataSource.box.read('branchId'),
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
        priceListModel = data;
      },
    );
  }
}
