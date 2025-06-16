import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/tables_state.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class TablesStatus extends StatelessWidget {
  const TablesStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TableStatusWidget(
          state: 'received'.tr,
          stateColor: AppColors.third,
        ),
        SizedBox(
          width: AppSize.width(5),
        ),
        TableStatusWidget(
          state: 'availabled'.tr,
          stateColor: AppColors.green,
        ),
        SizedBox(
          width: AppSize.width(5),
        ),
        TableStatusWidget(
          state: 'onDine'.tr,
          stateColor: AppColors.red,
        ),
      ],
    );
  }
}
