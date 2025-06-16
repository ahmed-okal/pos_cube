import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/payment_button_action_controller.dart';

import 'payment_button.dart';

class PaymentButtonAction extends GetView<PaymentButtonActionController> {
  const PaymentButtonAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => controller.handlePayment(),
        child: const PaymentButton(),
      ),
    );
  }
}
