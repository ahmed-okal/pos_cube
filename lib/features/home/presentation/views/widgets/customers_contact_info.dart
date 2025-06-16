import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../../data/models/customers_model.dart';

class CustomersContactInfo extends StatelessWidget {
  final Datum customer;
  const CustomersContactInfo({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customer.mobileNo?.isEmpty ?? true
              ? const SizedBox()
              : Container(
                  height: AppSize.height(18),
                  constraints: BoxConstraints(maxWidth: AppSize.width(99)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColors.lavenderGray,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: getSize(10),
                        color: AppColors.primaryColor,
                      ),
                      SizedBox(
                        width: AppSize.width(6),
                      ),
                      Text(
                        customer.mobileNo ?? '',
                        style: Responsive.isMobile(context)
                            ? AppTextStyle.primary8700
                            : AppTextStyle.primary11600,
                      ),
                    ],
                  ),
                ),
          if (customer.email?.isNotEmpty == true) ...[
            SizedBox(
              height: AppSize.height(5),
            ),
          ],
          if (customer.email?.isNotEmpty == true) ...[
            Container(
              height: AppSize.height(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: AppColors.lavenderGray,
                  width: 1,
                ),
              ),
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    size: getSize(10),
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: AppSize.width(6),
                  ),
                  Text(
                    customer.email ?? '',
                    style: Responsive.isMobile(context)
                        ? AppTextStyle.primary8700
                        : AppTextStyle.primary11600,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
