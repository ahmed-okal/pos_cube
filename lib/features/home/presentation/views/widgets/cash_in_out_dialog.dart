import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/cash_in_out_dialog_body.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';

class CashInOutDialog extends GetView<CategoriesController> {
  const CashInOutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      backgroundColor: AppColors.white,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSize.height(20),
        horizontal: AppSize.width(20),
      ),
      content: const CashInOutDialogBody(),
    );
  }
}
