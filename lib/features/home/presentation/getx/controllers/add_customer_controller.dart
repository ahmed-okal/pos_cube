import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/home/data/models/add_customer_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/add_customer_entity.dart';
import 'package:point_of_sale/features/home/domain/use_case/add_customer_use_case.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/customers_group_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/price_list_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class AddCustomerController extends GetxController {
  final AddCustomerUseCase addCustomerUseCase;
  AddCustomerController(this.addCustomerUseCase);
  final loading = true.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  AddCustomerModel addCustomerModel = AddCustomerModel();
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  final PriceListController priceListController =
      Get.find<PriceListController>();
  final CustomersGroupController customersGroupController =
      Get.find<CustomersGroupController>();

  final TextEditingController arName = TextEditingController();
  final TextEditingController enName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final selectedType = 'Company'.obs;

  // for dynamic addresses, maintain a list of controllers for each field
  final RxList<TextEditingController> addressNameControllers =
      <TextEditingController>[TextEditingController()].obs;
  final RxList<TextEditingController> streetControllers =
      <TextEditingController>[TextEditingController()].obs;
  final RxList<TextEditingController> buildingControllers =
      <TextEditingController>[TextEditingController()].obs;
  final RxList<TextEditingController> apartmentControllers =
      <TextEditingController>[TextEditingController()].obs;
  final RxList<TextEditingController> cityControllers =
      <TextEditingController>[TextEditingController()].obs;
  final RxList<TextEditingController> regionControllers =
      <TextEditingController>[TextEditingController()].obs;
  final RxList<TextEditingController> zipControllers =
      <TextEditingController>[TextEditingController()].obs;
  final RxList<TextEditingController> descControllers =
      <TextEditingController>[TextEditingController()].obs;

  // tabs state
  final RxList<String> addresses = <String>['${'address'.tr} 1'].obs;
  final selectedIndex = 0.obs;
  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
  }

  @override
  void onClose() {
    arName.dispose();
    enName.dispose();
    email.dispose();
    mobileNumber.dispose();
    for (final c in [
      ...addressNameControllers,
      ...streetControllers,
      ...buildingControllers,
      ...apartmentControllers,
      ...cityControllers,
      ...regionControllers,
      ...zipControllers,
      ...descControllers,
    ]) {
      c.dispose();
    }
    pageController.dispose();
    super.onClose();
  }

  void changeType(String? type) {
    if (type != null) selectedType.value = type;
  }

  void addAddress() {
    addresses.add('${'address'.tr} ${addresses.length + 1}');
    addressNameControllers.add(TextEditingController());
    streetControllers.add(TextEditingController());
    buildingControllers.add(TextEditingController());
    apartmentControllers.add(TextEditingController());
    cityControllers.add(TextEditingController());
    regionControllers.add(TextEditingController());
    zipControllers.add(TextEditingController());
    descControllers.add(TextEditingController());
    selectedIndex.value = addresses.length - 1;
    pageController.animateToPage(
      selectedIndex.value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void selectIndex(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    selectedIndex.value = index;
  }

  Future<void> addCustomer() async {
    final addressList = List.generate(
        addresses.length,
        (i) => {
              "name": addressNameControllers[i].text,
              "street": streetControllers[i].text,
              "buildingNumber": buildingControllers[i].text,
              "apartmentNumber": apartmentControllers[i].text,
              "city": cityControllers[i].text,
              "region": regionControllers[i].text,
              "zipCode": zipControllers[i].text,
              "desc": descControllers[i].text,
            });

    final result = await addCustomerUseCase(
      AddCustomerEntity(
        loading: loading,
        arName: arName.text,
        enName: enName.text,
        email: email.text,
        mobileNumber: mobileNumber.text,
        address: addressList,
        customerType: selectedType.value,
        customerGroupsId: customersGroupController.selectedGroupIds,
        listPriceId: priceListController.selectedPriceList.value ?? '',
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
        successSnackBar('customerAddedSuccessfully'.tr);
        addCustomerModel = data;
      },
    );
  }
}
