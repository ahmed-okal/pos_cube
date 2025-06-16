import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/payment/presentation/views/widgets/payment_keyboard.dart';
import 'package:point_of_sale/features/payment/presentation/views/widgets/payment_methods_list.dart';
import 'package:point_of_sale/features/payment/presentation/views/widgets/validate_back_buttons.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class PaymentLeftSide extends StatelessWidget {
  const PaymentLeftSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.width(416),
      child: Padding(
        padding: EdgeInsets.only(
          top: AppSize.height(22),
          right: AppSize.width(20),
          left: AppSize.width(20),
        ),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'paymentWith'.tr,
                style: AppTextStyle.primary18800,
              ),
            ),
            SizedBox(
              height: AppSize.height(12),
            ),
            SizedBox(
              height: AppSize.height(233),
              child: PaymentMethodsList(),
            ),
            SizedBox(
              height: AppSize.height(70),
            ),
            PaymentKeyboard(),
            ValidateAndBackButtons(),
            SizedBox(
              height: AppSize.height(12),
            ),
          ],
        ),
      ),
    );
  }
}
