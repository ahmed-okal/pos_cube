// widgets/payment_keyboard.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/core/utils/size_config.dart';

import '../../getx/controllers/payment_controller.dart';

class PaymentKeyboard extends GetView<PaymentController> {
  const PaymentKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 2.209302325581395,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildKey(
              '1', AppColors.white, () => controller.onNumberPressed('1')),
          _buildKey(
              '2', AppColors.white, () => controller.onNumberPressed('2')),
          _buildKey(
              '3', AppColors.white, () => controller.onNumberPressed('3')),
          _buildKey(
              '+10', AppColors.frostedMint, () => controller.onAddValue(10)),
          _buildKey(
              '4', AppColors.white, () => controller.onNumberPressed('4')),
          _buildKey(
              '5', AppColors.white, () => controller.onNumberPressed('5')),
          _buildKey(
              '6', AppColors.white, () => controller.onNumberPressed('6')),
          _buildKey(
              '+20', AppColors.frostedMint, () => controller.onAddValue(20)),
          _buildKey(
              '7', AppColors.white, () => controller.onNumberPressed('7')),
          _buildKey(
              '8', AppColors.white, () => controller.onNumberPressed('8')),
          _buildKey(
              '9', AppColors.white, () => controller.onNumberPressed('9')),
          _buildKey(
              '+50', AppColors.frostedMint, () => controller.onAddValue(50)),
          _buildKey('+/-', AppColors.yellow, _toggleSign),
          _buildKey(
              '0', AppColors.white, () => controller.onNumberPressed('0')),
          _buildKey('.', AppColors.primaryWithOpacity,
              () => controller.onNumberPressed('.')),
          _buildKey('x', AppColors.pink, controller.onClearPressed),
        ],
      ),
    );
  }

  void _toggleSign() {
    final currentVal =
        double.tryParse(controller.payOrderController.money.value);
    if (currentVal != null) {
      controller.payOrderController.money.value =
          (-currentVal).toStringAsFixed(2);
      controller.updateMethodPaidAmount();
    }
  }

  Widget _buildKey(String label, [Color? color, VoidCallback? onTap]) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.all(
        AppSize.height(4),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondry,
        ),
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: AppColors.primaryWithOpacity,
          onTap: onTap,
          child: Center(
            child: Text(
              label,
              style: AppTextStyle.primary20800,
            ),
          ),
        ),
      ),
    );
  }
}
