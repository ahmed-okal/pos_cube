import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/features/auth/login/presentation/views/widgets/pin_code.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/language_drop_down_button.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../getx/controllers/login_controller.dart';

class LogInView extends GetView<LoginController> {
  const LogInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.loading.isTrue
            ? const LoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: AppSize.width(50),
                        top: AppSize.height(43),
                      ),
                      child: LanguageDropDownButton(),
                    ),
                    SizedBox(
                      height: AppSize.height(51),
                    ),
                    Image.asset(
                      AppAssets.logoPOSUBE,
                      height: AppSize.height(117),
                    ),
                    SizedBox(
                      height: AppSize.height(12),
                    ),
                    Text(
                      'login'.tr,
                      style: AppTextStyle.primary20900,
                    ),
                    SizedBox(
                      height: AppSize.height(8),
                    ),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'welcome'.tr,
                            style: AppTextStyle.green20600,
                          ),
                          Text(
                            'pleaseEnterThePassword'.tr,
                            style: AppTextStyle.primary20600,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSize.height(53),
                    ),
                    Center(
                      child: SizedBox(
                        height: Responsive.isMobile(context)
                            ? AppSize.height(170)
                            : AppSize.height(150),
                        width: AppSize.height(692),
                        child: Column(
                          children: [
                            PinCode(),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: SizedBox(
                                width: Get.locale == const Locale('ar', 'EG')
                                    ? Responsive.isDesktop(context)
                                        ? AppSize.width(100)
                                        : AppSize.width(125)
                                    : Responsive.isDesktop(context)
                                        ? AppSize.width(100)
                                        : AppSize.width(125),
                                child: Column(
                                  children: [
                                    Text(
                                      'forgotPassword'.tr,
                                      style: Responsive.isMobile(context)
                                          ? AppTextStyle.green14600
                                          : AppTextStyle.green16600,
                                    ),
                                    Divider(
                                      height: 0,
                                      color: AppColors.green,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
