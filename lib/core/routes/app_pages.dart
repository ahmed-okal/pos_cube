import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../features/auth/login/presentation/getx/bindings/auth_binding.dart';
import '../../features/auth/login/presentation/views/log_in_view.dart';
import '../../features/create_session/presentation/getx/bindings/create_session_binding.dart';
import '../../features/create_session/presentation/views/create_session_view.dart';
import '../../features/home/presentation/getx/bindings/home_binding.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/payment/presentation/getx/bindings/payment_binding.dart';
import '../../features/payment/presentation/views/payment_view.dart';
import '../../features/print/presentation/getx/bindings/print_binding.dart';
import '../../features/print/presentation/views/print_view.dart';
import '../../features/settings/presentation/getx/bindings/settings_binding.dart';
import '../../features/settings/presentation/view/settings_page.dart';
import '../../features/tables/presentation/getx/bindings/tables_binding.dart';
import '../../features/tables/presentation/views/tables_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final box = GetStorage();

  // Dynamically set the initial route
  static String get initial {
    bool isAuthenticated = box.read('isAuthenticated') ?? false;
    return isAuthenticated ? Routes.createSession : Routes.login;
  }

  static final routes = [
    GetPage(
      name: _Paths.login,
      page: () => const LogInView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.createSession,
      page: () => const CreateSessionView(),
      binding: CreateSessionBinding(),
    ),
    GetPage(
      name: _Paths.paymentView,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.print,
      page: () => const PrintView(),
      binding: PrintBinding(),
    ),
    GetPage(
      name: _Paths.tables,
      page: () => const TablesView(),
      binding: TablesBinding(),
    ),
    GetPage(
      name: _Paths.settings,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
  ];
}
