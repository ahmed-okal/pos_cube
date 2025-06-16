import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';

import '../../../../../core/utils/responsive.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../getx/controllers/categories_controller.dart';
import 'food_section.dart';
import 'order_section.dart';

class HomeBody extends GetView<CategoriesController> {
  const HomeBody({
    super.key,
    required this.crossAxisCount,
  });

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.loading.isTrue ||
            // controller.orderController.loading.isTrue ||
            controller.ordersListController.loading.isTrue ||
            controller.allCategoryController.loading.isTrue) {
          return const LoadingWidget();
        } else {
          return RefreshIndicator(
            onRefresh: controller.refreshData,
            color: Colors.green,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColors.background,
                        width: Responsive.isMobile(context)
                            ? AppSize.width(0)
                            : AppSize.width(425),
                        child: OrderSection(),
                      ),
                      // SizedBox(
                      //   width: Responsive.isMobile(context)
                      //       ? AppSize.width(0)
                      //       : AppSize.width(2),
                      // ),
                      FoodSection(crossAxisCount: crossAxisCount),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
