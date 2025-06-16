import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/tables_container.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/tables_status.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/tables_controller.dart';

class TablesRightSide extends GetView<TablesController> {
  const TablesRightSide({
    required this.margin,
    super.key,
  });
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: margin,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'manageTables'.tr,
                  style: AppTextStyle.primary20800,
                ),
                const Spacer(),
                TablesPlaces(),
              ],
            ),
            TablesStatus(),
            TablesContainer(
              margin: EdgeInsetsDirectional.only(
                top: AppSize.height(16),
                bottom: AppSize.height(23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TablesPlaces extends GetView<TablesController> {
  const TablesPlaces({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(27),
      width: AppSize.width(184),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.tablesModel.data?.length ?? 0,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: AppSize.width(8),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              controller.selectTablesPlase(index);
            },
            child: Obx(
              () => AnimatedContainer(
                height: AppSize.height(27),
                width: AppSize.width(88),
                decoration: BoxDecoration(
                  color: controller.selectTablesPlase.value == index
                      ? AppColors.primaryColor
                      : AppColors.white,
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(6),
                ),
                duration: const Duration(milliseconds: 200),
                child: Center(
                  child: Text(
                    Get.locale?.languageCode == 'ar'
                        ? (controller.tablesModel.data?[index].nameAr?.trim() ??
                            '')
                        : (controller.tablesModel.data?[index].nameEn?.trim() ??
                            ''),
                    style: controller.selectTablesPlase.value == index
                        ? AppTextStyle.white12800
                        : AppTextStyle.primary12700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
