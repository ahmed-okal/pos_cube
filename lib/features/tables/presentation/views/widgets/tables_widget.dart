import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/tables_controller.dart';

class TablesWidget extends GetView<TablesController> {
  const TablesWidget({
    required this.index,
    required this.tableCode,
    required this.imagePath,
    super.key,
  });
  final int index;
  final String tableCode, imagePath;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        constraints: BoxConstraints(
          minHeight: AppSize.height(15),
          minWidth: AppSize.width(20),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: controller.selectedTable.value == index ? 2 : 0,
            color: controller.selectedTable.value == index
                ? AppColors.primaryColor
                : Colors.transparent,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                tableCode,
                style: AppTextStyle.green20700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
