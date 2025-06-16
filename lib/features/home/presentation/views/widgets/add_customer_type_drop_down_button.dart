import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/add_customer_controller.dart';

class AddCustomerTypeDropDownButton extends GetView<AddCustomerController> {
  const AddCustomerTypeDropDownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height(36),
      width: AppSize.width(255),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryWithOpacity2,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Obx(
          () => DropdownButton<String>(
            borderRadius: BorderRadius.circular(6),
            elevation: 1,
            dropdownColor: AppColors.customerSelcet,
            isExpanded: true,
            underline: const SizedBox(),
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(16),
            ),
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.primaryColor,
              size: AppSize.height(24),
            ),
            value: controller.selectedType.value,
            items: [
              DropdownMenuItem(
                value: 'Company',
                child: Text(
                  'company'.tr,
                  style: AppTextStyle.primary15500,
                ),
              ),
              DropdownMenuItem(
                value: 'Individuals',
                child: Text(
                  'individuals'.tr,
                  style: AppTextStyle.primary15500,
                ),
              ),
            ],
            onChanged: controller.changeType,
          ),
        ),
      ),
    );
  }
}
