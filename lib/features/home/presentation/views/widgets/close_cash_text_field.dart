import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../getx/controllers/close_session_controller.dart';

class CloseCashTextField extends GetView<CloseSessionController> {
  const CloseCashTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.closeCash,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 6,
      maxLines: 1,
      decoration: InputDecoration(
        counterText: '',
        hintText: '0.00',
        hintStyle: AppTextStyle.primary18800,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.secondry,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.secondry,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryWithOpacity,
          ),
        ),
        // suffixIcon: IconButton(
        //   icon: const Icon(Icons.close),
        //   onPressed: () {
        //     controller.closeCash.clear();
        //   },
        // ),
      ),
    );
  }
}
