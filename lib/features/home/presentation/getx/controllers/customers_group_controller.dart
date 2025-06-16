import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../data/models/customer_group_model.dart';
import '../../../domain/entitis/customers_group_entity.dart';
import '../../../domain/use_case/customers_group_use_case.dart';

class CustomersGroupController extends GetxController {
  final CustomersGroupUseCase customersGroupUseCase;
  CustomersGroupController(this.customersGroupUseCase);
  final multiSelectController = MultiSelectController<String>();
  final loading = true.obs;
  final selectedGroupIds = <String>[].obs;
  CustomersGroupModel customersGroupModel = CustomersGroupModel();
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  Future<void> getCustomersGroup() async {
    final result = await customersGroupUseCase(
      CustomersGroupEntity(
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
        final items = data.data!
            .map((d) => DropdownItem<String>(
                  label: d.groupName!.first.text!,
                  value: d.id!,
                ))
            .toList();
        multiSelectController.setItems(items);
        customersGroupModel = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getCustomersGroup();
    multiSelectController;
  }
}
