import 'package:flutter/material.dart';
import 'package:point_of_sale/features/payment/presentation/views/widgets/remaining_amount_widget.dart';
import 'package:point_of_sale/features/payment/presentation/views/widgets/selected_method_amount_widget.dart';
import 'package:point_of_sale/features/payment/presentation/views/widgets/total_amount_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class PaymentRightSide extends StatelessWidget {
  const PaymentRightSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: AppSize.height(21),
          end: AppSize.width(25),
          start: AppSize.width(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TotalAmountWidget(),
            SizedBox(
              height: AppSize.height(15),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: AppColors.white,
                  border: Border.all(
                    color: AppColors.third,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const RemainingAmountWidget(),
                    SizedBox(
                      height: AppSize.height(16),
                    ),
                    const SelectedMethodAmountWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
