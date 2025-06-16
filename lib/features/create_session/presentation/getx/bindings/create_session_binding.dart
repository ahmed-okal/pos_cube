import 'package:get/get.dart';
import 'package:point_of_sale/features/create_session/presentation/getx/controllers/open_session_controller.dart';
import 'package:point_of_sale/injection_controller.dart';

import '../../../../../core/services/cash_data_source.dart';
import '../controllers/clock_controller.dart';
import '../controllers/create_session_controller.dart';

class CreateSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateSessionController>(
      () => CreateSessionController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<ClockController>(
      () => ClockController(),
    );

    Get.lazyPut<OpenSessionController>(
      () => OpenSessionController(
        InjectionController().getIt(),
      ),
    );
    Get.lazyPut<CashDataSource>(
      () => CashDataSource(),
    );
  }
}
