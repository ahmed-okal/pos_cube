import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/drawer_controller.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/cash_in_out_dialog.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import 'close_session_dialog_body.dart';
import 'custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Use GetX to create the controller only when needed
    return GetX<AppDrawerController>(
      init: AppDrawerController(),
      builder: (controller) {
        return Column(
          children: [
            SizedBox(
              height: AppSize.height(20),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                margin: EdgeInsetsDirectional.only(
                  top: AppSize.height(16),
                  end: AppSize.width(8),
                ),
                height: AppSize.height(32),
                width: AppSize.width(116),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.8,
                    color: AppColors.lavenderGray,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: SizedBox(),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.width(16),
                    ),
                    // style: AppTextStyle.green32800,
                    value: Get.locale?.languageCode ?? 'en',
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.primaryColor,
                      size: AppSize.height(24),
                    ),
                    // underline: const SizedBox(),
                    items: [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(
                          'العربية',
                          style: AppTextStyle.primary14700,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(
                          'English',
                          style: AppTextStyle.primary14700,
                        ),
                      ),
                    ],
                    onChanged: (String? newLang) {
                      if (newLang != null) {
                        Locale locale = newLang == 'ar'
                            ? const Locale('ar', 'EG')
                            : const Locale('en', 'US');
                        Get.updateLocale(locale);
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.height(33),
            ),
            Container(
              height: AppSize.height(58),
              width: AppSize.height(58),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkGreen,
              ),
              child: Center(
                child: Text(
                  controller.loginController.userName.value.isNotEmpty
                      ? controller.loginController.userName.value
                          .substring(0, 1)
                      : '',
                  style: AppTextStyle.white29600,
                ),
              ),
            ),
            SizedBox(
              height: AppSize.height(12),
            ),
            Text(
              controller.loginController.userName.value.isNotEmpty
                  ? controller.loginController.userName.value
                  : '',
              style: AppTextStyle.darkgreen20600,
            ),
            SizedBox(
              height: AppSize.height(18),
            ),
            DrawerItem(
              onTap: () {
                controller.navigateToHome();
              },
              icon: AppAssets.homeIcon,
              title: 'home'.tr,
            ),
            Divider(
              color: AppColors.third,
            ),
            DrawerItem(
              onTap: () {},
              icon: AppAssets.orderIcon,
              title: 'orders'.tr,
            ),
            const Divider(
              color: AppColors.third,
            ),
            DrawerItem(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return const CashInOutDialog();
                  },
                );
              },
              icon: AppAssets.cashInOut,
              title: 'cashIn/out'.tr,
            ),
            Divider(
              color: AppColors.third,
            ),
            DrawerItem(
              onTap: () {
                controller.navigateToTables();
              },
              icon: AppAssets.reservationIcon,
              title: 'reservation'.tr,
            ),
            Divider(
              color: AppColors.third,
            ),
            DrawerItem(
              onTap: () {
                controller.navigateToSettings();
              },
              icon: AppAssets.settingIcon,
              title: 'setting'.tr,
            ),
            Divider(
              color: AppColors.third,
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(8),
              ),
              child: InkWell(
                onTap: () {
                  controller.prepareCloseSession();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: AppColors.white,
                        title: Center(
                          child: Text(
                            'closeSession'.tr,
                            style: AppTextStyle.primary20800,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSize.width(25),
                          vertical: AppSize.height(25),
                        ),
                        scrollable: true,
                        content: const CloseSessionDialogBody(),
                      );
                    },
                  );
                },
                child: Container(
                  height: AppSize.height(33),
                  decoration: BoxDecoration(
                    color: AppColors.third,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'closeSession'.tr,
                      style: AppTextStyle.primary18700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.height(8),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.width(8),
              ),
              child: InkWell(
                onTap: () {
                  controller.logout();
                  successSnackBar('logoutSuccessfully'.tr);
                },
                child: Container(
                  height: AppSize.height(33),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    border: Border.all(
                      color: AppColors.lavenderGray,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'logout'.tr,
                      style: AppTextStyle.primary18700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppSize.height(50),
            ),
          ],
        );
      },
    );
  }
}
