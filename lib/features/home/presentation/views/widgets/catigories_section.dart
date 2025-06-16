import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/categories_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/responsive.dart';
import '../../../../../core/utils/size_config.dart';
import 'categories_item_button.dart';

class CategoriesSection extends GetView<CategoriesController> {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: AppSize.height(20),
        bottom: AppSize.height(20),
        start: AppSize.width(20),
      ),
      child: SizedBox(
        height: Responsive.isMobile(context)
            ? AppSize.height(60)
            : AppSize.height(33),
        child: Obx(
          () => Skeletonizer(
            enabled: controller.loading.isTrue,
            child: ListView.separated(
              primary: false,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: (controller.categoriesTaskModel.data?.length ?? 0) + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () => controller.changeCategory(0),
                    child: Obx(() {
                      final isActive = controller.selectedIndex.value == 0;
                      return CategoriesItemButton(
                        text: 'all'.tr,
                        color:
                            isActive ? AppColors.primaryColor : AppColors.white,
                        style: isActive
                            ? AppTextStyle.white16700
                            : AppTextStyle.primary16700,
                      );
                    }),
                  );
                } else {
                  final category =
                      controller.categoriesTaskModel.data?[index - 1];
                  return InkWell(
                    onTap: () => controller.changeCategory(index),
                    child: Obx(
                      () {
                        final isActive =
                            controller.selectedIndex.value == index;
                        return CategoriesItemButton(
                          text: Get.locale == const Locale('ar', 'EG')
                              ? (category?.categoryName?.last.text
                                              ?.isNotEmpty ==
                                          true
                                      ? category?.categoryName?.last.text
                                      : category?.categoryName?.first.text) ??
                                  ''
                              : (category?.categoryName?.first.text
                                              ?.isNotEmpty ==
                                          true
                                      ? category?.categoryName?.first.text
                                      : category?.categoryName?.last.text) ??
                                  '',
                          color: isActive
                              ? AppColors.primaryColor
                              : AppColors.white,
                          style: isActive
                              ? AppTextStyle.white16800
                              : AppTextStyle.primary16800,
                        );
                      },
                    ),
                  );
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: AppSize.width(5),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
