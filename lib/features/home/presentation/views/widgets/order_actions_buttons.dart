import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/actions_button.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/customer_button.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/keyboard_down_button.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/kitchen_note_button.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';

class OrderActionsButton extends GetView<CategoriesController> {
  const OrderActionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        spacing: AppSize.width(8),
        children: [
          const CustomerButton(),
          const KitchenNoteButton(),
          const ActionsButton(),
          if (controller.orderController.selectedIndex.value != -1) ...[
            KeyboardDownButton(),
          ],
        ],
      ),
    );
  }
}
