import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/kitchen_note_tab_bar_button.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/kitchen_note_controller.dart';

class KitchenNoteDialogTabBar extends GetView<KitchenNoteController> {
  const KitchenNoteDialogTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() {
          final isSelected = (controller.selectedTabIndex.value == 0);
          return KitchenNoteTabBarButton(
            isSelected: isSelected,
            onTap: () => controller.onTabChanged(0),
            title: 'wait'.tr,
          );
        }),
        SizedBox(
          width: AppSize.width(7),
        ),
        Obx(() {
          final isSelected = (controller.selectedTabIndex.value == 1);
          return KitchenNoteTabBarButton(
            isSelected: isSelected,
            onTap: () => controller.onTabChanged(1),
            title: 'toServe'.tr,
          );
        }),
        SizedBox(
          width: AppSize.width(7),
        ),
        Obx(() {
          final isSelected = (controller.selectedTabIndex.value == 2);
          return KitchenNoteTabBarButton(
            isSelected: isSelected,
            onTap: () => controller.onTabChanged(2),
            title: 'emergency'.tr,
          );
        }),
        SizedBox(
          width: AppSize.width(7),
        ),
        Obx(
          () {
            final isSelected = (controller.selectedTabIndex.value == 3);
            return KitchenNoteTabBarButton(
              isSelected: isSelected,
              onTap: () => controller.onTabChanged(3),
              title: 'noDressing'.tr,
            );
          },
        ),
      ],
    );
  }
}
