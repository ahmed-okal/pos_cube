import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:point_of_sale/core/utils/size_config.dart';

import 'core/locale/locale.dart';
import 'core/routes/app_pages.dart';
import 'core/utils/app_colors.dart';
import 'injection_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]);

  await InjectionController().initialize();
  await initializeDateFormatting('en_US', null);
  await initializeDateFormatting('ar_EG', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return GetMaterialApp(
      scrollBehavior:
          const MaterialScrollBehavior().copyWith(scrollbars: false),
      translations: MyLocale(),
      locale: const Locale('en', 'Us'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        popupMenuTheme: PopupMenuThemeData(
          color: AppColors.background,
        ),
        dividerColor: AppColors.secondry,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.background,
        ),
        scaffoldBackgroundColor: AppColors.white,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primaryColor,
          selectionColor: AppColors.primaryWithOpacity2,
          selectionHandleColor: AppColors.primaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
