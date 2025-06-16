import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/data/models/customers_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/customers_entity.dart';
import 'package:point_of_sale/features/home/domain/use_case/customers_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class CustomersController extends GetxController {
  final CustomersUseCase customersUseCase;
  CustomersController(this.customersUseCase);

  final loading = true.obs;
  final RxnString selectedCustomerId = RxnString();

  // Observable list for filtered customers (using Datum)
  RxList<Datum> filteredCustomers = <Datum>[].obs;

  // Filter customers based on search query (by name or mobile number)
  void filterCustomers(String query) {
    if (query.isEmpty) {
      filteredCustomers.value = customersModel.data ?? [];
    } else {
      filteredCustomers.value = (customersModel.data ?? []).where((customer) {
        // Handle fullname safely: ensure the list is not empty.
        final name = (customer.fullname?.isNotEmpty ?? false)
            ? (Get.locale == const Locale('ar', 'EG')
                ? customer.fullname!.first.text ?? ''
                : customer.fullname!.last.text ?? '')
            : '';
        final mobile = customer.mobileNo ?? '';
        return name.toLowerCase().contains(query.toLowerCase()) ||
            mobile.contains(query);
      }).toList();
    }
  }

  CustomersModel customersModel = CustomersModel();
  final CashDataSource cashDataSource = Get.put(CashDataSource());

  Future<void> getCustomers() async {
    final result = await customersUseCase(
      CustomersEntity(
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
        customersModel = data;
        // Initialize filteredCustomers with the full list
        filteredCustomers.value = customersModel.data ?? [];
      },
    );
  }

  void toggleSelection(String id) {
    if (selectedCustomerId.value == id) {
      selectedCustomerId.value = null;
    } else {
      selectedCustomerId.value = id;
    }
  }
}
