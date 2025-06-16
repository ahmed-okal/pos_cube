import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/tables_grid_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../getx/controllers/tables_controller.dart';

class TablesContainer extends GetView<TablesController> {
  const TablesContainer({
    super.key,
    required this.margin,
  });
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: margin,
        decoration: BoxDecoration(
          color: AppColors.tablesBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.selectTablesPage(index);
          },
          itemBuilder: (BuildContext context, int index) {
            return

                // child:
                TablesGidView();
            // );
          },
        ),
      ),
    );
  }
}
