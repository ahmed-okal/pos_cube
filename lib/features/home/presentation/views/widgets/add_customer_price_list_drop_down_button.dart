import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/price_list_controller.dart';

class PriceListDropdown extends GetView<PriceListController> {
  const PriceListDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final items = controller.priceListModel.data ?? [];

    return Obx(
      () => controller.loading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: AppSize.height(36),
              width: AppSize.width(255),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryWithOpacity2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: DropdownButton<String>(
                  dropdownColor: AppColors.customerSelcet,
                  menuMaxHeight: AppSize.height(300),
                  elevation: 1,
                  borderRadius: BorderRadius.circular(6),
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
                  value: controller.selectedPriceList.value,
                  hint: Text(
                    'selectAPriceList'.tr,
                    style: AppTextStyle.primary15500,
                  ),
                  items: items.map(
                    (datum) {
                      return DropdownMenuItem<String>(
                        value: datum.id.toString(),
                        child: Text(
                          datum.name ?? '',
                          style: AppTextStyle.primary15500,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: controller.changePriceList,
                ),
              ),
            ),
    );
  }
}
