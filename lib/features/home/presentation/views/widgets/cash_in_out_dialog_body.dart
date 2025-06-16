import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/cash_in_out_body.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/cash_in_out_dialog_buttons.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/cash_in_out_dialog_tab_bar.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';

class CashInOutDialogBody extends GetView<CategoriesController> {
  const CashInOutDialogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(310),
      width: AppSize.width(705),
      child: Column(
        children: [
          const CashInOutDialogTabBar(),
          SizedBox(
            height: AppSize.height(20),
          ),
          SizedBox(
            height: AppSize.height(197),
            child: PageView(
              controller: controller.cashInOutController.pageController,
              onPageChanged: (index) {
                controller.cashInOutController.selectedTabIndex.value = index;
              },
              children: [
                CashInOutBody(
                  cashKey: controller.cashInOutController.cashInFormKey,
                  noteKey: controller.cashInOutController.noteInFormKey,
                  cash: controller.cashInOutController.cashIn,
                  note: controller.cashInOutController.noteIn,
                ),
                CashInOutBody(
                  cashKey: controller.cashInOutController.cashOutFormKey,
                  noteKey: controller.cashInOutController.noteOutFormKey,
                  cash: controller.cashInOutController.cashOut,
                  note: controller.cashInOutController.noteOut,
                ),
              ],
            ),
          ),
          const Spacer(),
          const CashInOutDialogButtons(),
        ],
      ),
    );
  }
}
