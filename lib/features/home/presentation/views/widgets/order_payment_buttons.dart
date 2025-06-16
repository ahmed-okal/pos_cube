import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';
import 'holding_button.dart';
import 'payment_button_action.dart';

class OrderPaymentButtons extends GetView<CategoriesController> {
  const OrderPaymentButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.width(8),
      children: const [
        HoldingButton(),
        PaymentButtonAction(),
      ],
    );
  }
}
