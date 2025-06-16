import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/categories_controller.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/all_categories_grid_view.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/categories_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FoodView extends GetView<CategoriesController> {
  const FoodView({
    super.key,
    required this.crossAxisCount,
  });

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Skeletonizer(
          enabled: controller.loading.isTrue,
          child: PageView.builder(
            controller: controller.pageController,
            onPageChanged: (index) => controller.selectedIndex.value = index,
            itemCount: (controller.categoriesTaskModel.data?.length ?? 0) + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return AllCategoryGridView(crossAxisCount: crossAxisCount);
              } else {
                return CategoriesGridView(
                    index: index, crossAxisCount: crossAxisCount);
              }
            },
          ),
        ),
      ),
    );
  }
}
