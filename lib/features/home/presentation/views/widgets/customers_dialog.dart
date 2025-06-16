import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/customers_controller.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/customers_dialog_body.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class CustomersDialog extends GetView<CustomersController> {
  const CustomersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      backgroundColor: AppColors.white,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSize.height(30),
        horizontal: AppSize.width(26),
      ),
      content: const CustomersDialogBody(),
    );
  }
}
