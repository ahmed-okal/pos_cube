import 'package:get/get.dart';
import 'package:point_of_sale/features/home/data/models/all_category_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/all_category_entity.dart';
import 'package:point_of_sale/features/home/domain/use_case/all_category_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class AllCategoryController extends GetxController {
  final AllCategoryUseCase allCategoryUseCase;
  AllCategoryModel allCategoryModel = AllCategoryModel();
  final loading = true.obs;
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  AllCategoryController(this.allCategoryUseCase);
  Future<void> getAllCategory() async {
    final result = await allCategoryUseCase(
      AllCategoryEntity(
        loading: loading,
        tenantId: cashDataSource.box.read('tenantId'),
        companyId: cashDataSource.box.read('companyId'),
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
        allCategoryModel = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategory();
  }
}
