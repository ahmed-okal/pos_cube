import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:point_of_sale/core/utils/size_config.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/responsive.dart';
import '../../../../../../core/utils/size_utils.dart';
import '../../getx/controllers/login_controller.dart';

class PinCode extends GetView<LoginController> {
  const PinCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context)
              ? AppSize.width(10)
              : AppSize.width(0),
        ),
        child: Form(
          key: controller.formKey,
          child: PinCodeTextField(
            obscureText: true,
            // obscuringCharacter: '*',
            obscuringWidget: Center(
              child: Text(
                '*',
                style: TextStyle(
                  height: Responsive.isDesktop(context) ? 2.0 : 1.0,
                  fontSize: Responsive.isMobile(context)
                      ? getFontSize(28)
                      : getFontSize(52),
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            blinkWhenObscuring: true,
            animationType: AnimationType.fade,
            errorTextMargin: const EdgeInsets.all(0),
            enabled: true,
            scrollPadding: EdgeInsets.zero,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            appContext: context,
            length: 6,
            autoFocus: true,
            textStyle: Responsive.isMobile(context)
                ? AppTextStyle.primary20700
                : AppTextStyle.primary53700,
            textCapitalization: TextCapitalization.characters,
            autovalidateMode: AutovalidateMode.disabled,
            autoDismissKeyboard: true,
            autoUnfocus: true,
            enablePinAutofill: true,
            autoDisposeControllers: false,
            cursorHeight: AppSize.height(49),
            enableActiveFill: true,
            pinTheme: PinTheme(
              disabledColor: AppColors.white,
              activeFillColor: AppColors.white,
              activeColor: AppColors.primaryColor,
              selectedFillColor: AppColors.white,
              inactiveColor: AppColors.secondry,
              inactiveFillColor: AppColors.white,
              selectedColor: AppColors.primaryColor,
              shape: PinCodeFieldShape.box,
              fieldWidth: Responsive.isMobile(context)
                  ? AppSize.height(99)
                  : AppSize.height(99),
              fieldHeight: Responsive.isMobile(context)
                  ? AppSize.height(94)
                  : AppSize.height(94),
              borderWidth: 1,
              borderRadius: BorderRadius.circular(8),
            ),
            controller: controller.otpController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'enterThePinCode'.tr;
              } else if (value.length < 6) {
                return 'wrongPinCode'.tr;
              }
              return null;
            },
            onCompleted: (value) {
              controller.login();
            },
          ),
        ),
      ),
    );
  }
}
