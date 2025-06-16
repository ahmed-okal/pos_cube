import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/auth/login/presentation/getx/controllers/login_controller.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/date_picker_controller.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/reservations_controller.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../data/models/tables_model.dart';
import '../../../domain/entities/get_tables_entity.dart';
import '../../../domain/use_case/get_tables_use_case.dart';

class TablesController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();
  // final AvailableReservationController availableReservationController =
  //     Get.find<AvailableReservationController>();
  final ReservationsController reservationsController =
      Get.find<ReservationsController>();
  final DatePickerController datePickerController =
      Get.find<DatePickerController>();
  final loading = true.obs;
  TablesModel tablesModel = TablesModel();
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  final GetTablesUseCase getTablesUseCase;
  TablesController(this.getTablesUseCase);
  final RxInt selectedTable = (-1).obs;
  void setSelectedTable(int index) {
    selectedTable.value = index;
  }

  late final PageController pageController;
  void selectTablesPage(int index) {
    selectTablesPlase.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  final RxInt selectTablesPlase = 0.obs;

  final List<String> tableImages = [
    'assets/images/table2busy.png', //0  busy
    'assets/images/table4busy.png', //1
    'assets/images/table6busy.png', //2
    'assets/images/table8busy.png', //3
    'assets/images/table10busy.png', //4
    'assets/images/table12busy.png', //5
    'assets/images/table2empty.png', //6  empty
    'assets/images/table4empty.png', //7
    'assets/images/table6empty.png', //8
    'assets/images/table8empty.png', //9
    'assets/images/table10empty.png', //10
    'assets/images/table12empty.png', //11
    'assets/images/table2reserved.png', //12  reserved
    'assets/images/table4reserved.png', //13
    'assets/images/table6reserved.png', //14
    'assets/images/table8reserved.png', //15
    'assets/images/table10reserved.png', //16
    'assets/images/table12reserved.png', //17
  ];

  String getTableImage(int? noOfSeats, int? status) {
    // Default to empty table image if no seats or status provided
    if (noOfSeats == null || status == null) {
      return tableImages[6]; // Default to 2-seat empty table
    }

    // Calculate base index based on number of seats
    final int baseIndex = switch (noOfSeats) {
      2 => 0,
      4 => 1,
      6 => 2,
      8 => 3,
      10 => 4,
      12 => 5,
      _ => 0, // Default to 2-seat table if unknown size
    };

    // Calculate offset based on status
    final int statusOffset = switch (status) {
      1 => 6, // Empty tables start at index 6
      2 => 0, // Busy tables start at index 0
      3 => 12, // Reserved tables start at index 12
      _ => 6, // Default to empty table if unknown status
    };

    // Return the appropriate image
    return tableImages[baseIndex + statusOffset];
  }

  Future<void> getTables() async {
    final result = await getTablesUseCase(GetTablesEntity(
      loading: loading,
      tenantId: cashDataSource.box.read('tenantId'),
      companyId: cashDataSource.box.read('companyId'),
      branchId: cashDataSource.box.read('branchId'),
    ));
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
        tablesModel = data;
      },
    );
  }

  @override
  void onInit() {
    getTables();
    pageController = PageController();
    super.onInit();
  }
}
