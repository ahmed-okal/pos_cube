import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/customers_group_controller.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../data/models/customer_group_model.dart';

class AddCustomerGroupDropDownButton extends GetView<CustomersGroupController> {
  const AddCustomerGroupDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    final list = controller.customersGroupModel.data ?? [];
    return Obx(
      () {
        if (controller.loading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final dropdownItems = list.map((d) {
          final name = d.groupName
                  ?.firstWhere((g) => g.lang == Lang.ar,
                      orElse: () => d.groupName!.first)
                  .text ??
              '';
          return DropdownItem<String>(
            label: name,
            value: d.id!,
          );
        }).toList();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.multiSelectController.setItems(dropdownItems);
        });
        return MultiDropdown<String>(
          controller: controller.multiSelectController,
          items: dropdownItems,
          enabled: true,
          searchEnabled: false,
          onSelectionChange: (selectedItems) {
            controller.selectedGroupIds.value =
                selectedItems.map((i) => i).toList();
          },
          dropdownItemDecoration: DropdownItemDecoration(
            selectedBackgroundColor: AppColors.customerSelcet,
            selectedTextColor: AppColors.primaryColor,
            textColor: AppColors.primaryColor,
            backgroundColor: AppColors.customerSelcet,
            disabledTextColor: AppColors.primaryColor,
            disabledBackgroundColor: AppColors.customerSelcet,
            selectedIcon: const Icon(
              Icons.check,
              color: AppColors.green,
            ),
          ),
          fieldDecoration: FieldDecoration(
            hintText: 'selectCustomerGroup'.tr,
            hintStyle: AppTextStyle.primary15500,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.primaryWithOpacity2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.primaryWithOpacity2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: AppColors.primaryWithOpacity2),
            ),
            borderRadius: 6,
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(8),
            ),
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.primaryColor,
              size: AppSize.height(24),
            ),
            showClearIcon: false,
          ),
          chipDecoration: ChipDecoration(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(3),
              vertical: AppSize.height(3),
            ),
            spacing: AppSize.width(6),
            borderRadius: BorderRadius.circular(6),
            backgroundColor: AppColors.primaryWithOpacity3,
            labelStyle: AppTextStyle.primary15500,
            deleteIcon: Icon(
              Icons.close,
              size: AppSize.height(12),
              color: AppColors.primaryColor,
            ),
          ),
          dropdownDecoration: DropdownDecoration(
            backgroundColor: AppColors.customerSelcet,
            borderRadius: BorderRadius.circular(6),
          ),
        );
      },
    );
  }
}
