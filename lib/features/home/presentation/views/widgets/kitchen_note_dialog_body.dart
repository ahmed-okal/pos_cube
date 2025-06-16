import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/kitchen_note_body.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/kitchen_note_dialog_buttons.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/kitchen_note_dialog_tab_bar.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/kitchen_note_controller.dart';

class KitchenNoteDialogBody extends GetView<KitchenNoteController> {
  const KitchenNoteDialogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(268),
      width: AppSize.width(705),
      child: Column(
        children: [
          const KitchenNoteDialogTabBar(),
          SizedBox(
            height: AppSize.height(22),
          ),
          SizedBox(
            height: AppSize.height(122),
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.selectedTabIndex.value = index;
              },
              children: const [
                KitchenNoteBody(),
                KitchenNoteBody(),
                KitchenNoteBody(),
                KitchenNoteBody(),
              ],
            ),
          ),
          const Spacer(),
          const KitchenNoteDialogButtons(),
        ],
      ),
    );
  }
}
