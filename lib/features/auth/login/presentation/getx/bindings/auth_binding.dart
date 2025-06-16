import 'package:get/get.dart';
import 'package:point_of_sale/injection_controller.dart';

import '../../../../../../core/services/cash_data_source.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CashDataSource(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        InjectionController().getIt(),
      ),
    );
  }
}
