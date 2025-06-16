import 'package:flutter/material.dart';
import 'package:point_of_sale/features/payment/presentation/views/widgets/payment_left_side.dart';
import 'package:point_of_sale/features/payment/presentation/views/widgets/payment_right_side.dart';

import '../../../../../core/utils/app_colors.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Row(
        children: [
          const PaymentLeftSide(),
          const PaymentRightSide(),
        ],
      ),
    );
  }
}
