import 'package:get/get.dart';

import '../../../../../core/services/cash_data_source.dart';
import '../controllers/printers_ip_address_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CashDataSource());
    Get.lazyPut<PrintersIPAddressController>(
      () => PrintersIPAddressController(),
    );
  }
}
