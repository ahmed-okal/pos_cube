import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/core/utils/size_config.dart';
import 'package:point_of_sale/core/utils/size_utils.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../getx/controllers/create_session_controller.dart';

class OpenCashTextField extends GetView<CreateSessionController> {
  const OpenCashTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.openSessionController.openCashController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: AppTextStyle.primary20700,
      maxLength: 6,
      decoration: InputDecoration(
        hintText: '0.00',
        hintStyle: AppTextStyle.primary20600,
        counterText: '',
        contentPadding: EdgeInsets.all(
          AppSize.height(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.secondry,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.secondry,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.close,
            color: AppColors.primaryColor,
            size: getSize(24),
          ),
          onPressed: () {
            controller.openSessionController.openCashController.clear();
          },
        ),
      ),
    );
  }
}
