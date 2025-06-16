import 'package:get/get.dart';
import 'package:point_of_sale/core/routes/app_pages.dart';
import 'package:point_of_sale/core/services/cash_data_source.dart';
import 'package:point_of_sale/features/auth/login/presentation/getx/controllers/login_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/get_cash_in_out_controller.dart';

/// A dedicated controller for the drawer to reduce dependencies
class AppDrawerController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();
  final GetCashInOutController getCashInOutController = Get.find<GetCashInOutController>();
  final CashDataSource cashDataSource = Get.put(CashDataSource());

  void navigateToHome() {
    Get.offNamed(Routes.home);
  }

  void navigateToTables() {
    Get.offNamed(Routes.tables);
  }

  void navigateToSettings() {
    Get.toNamed(Routes.settings);
  }

  void logout() {
    Get.offAllNamed(Routes.login);
    cashDataSource.logout();
  }

  void prepareCloseSession() {
    getCashInOutController.getCashInOut();
  }
}
