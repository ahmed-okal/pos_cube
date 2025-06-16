import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../../../home/presentation/getx/controllers/create_new_order_controller.dart';
import '../../getx/controllers/tables_controller.dart';
import 'add_new_reservation_confirm_buttons.dart';
import 'add_new_reservation_data_section.dart';
import 'select_date_picker.dart';
import 'table_display_container.dart';

class AddNewReservationButton extends GetView<TablesController> {
  const AddNewReservationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.availableReservationController.getAvailableReservation();
        if (controller.selectedTable.value == -1) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              scrollable: true,
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              contentPadding: EdgeInsets.zero,
              content: AddNewReservationDialogBody(),
            ),
          );
        } else {
          final createNewOrderController = Get.find<CreateNewOrderController>();
          createNewOrderController.setOrderType(1);
          createNewOrderController.getCreateNewOrder();
          Get.offNamed(Routes.home);
        }
      },
      child: Container(
        height: AppSize.height(33),
        width: double.infinity,
        margin: EdgeInsetsDirectional.only(
          start: AppSize.width(50),
          end: AppSize.width(35),
        ),
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline_rounded,
              size: getSize(24),
              color: AppColors.white,
            ),
            SizedBox(
              width: AppSize.width(3),
            ),
            Text(
              'addNewReservation'.tr,
              style: AppTextStyle.white16800,
            ),
          ],
        ),
      ),
    );
  }
}

class AddNewReservationDialogBody extends StatelessWidget {
  const AddNewReservationDialogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(471),
      width: AppSize.width(725),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: AppSize.width(32),
          end: AppSize.width(32),
          top: AppSize.height(32),
          bottom: AppSize.height(18),
        ),
        child: Column(
          children: [
            const AddNewReservationDataSection(),
            SizedBox(
              height: AppSize.height(16),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSize.width(14),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'date'.tr,
                      style: AppTextStyle.primary16700,
                    ),
                    const SelectDatePicker(),
                  ],
                ),
                const TableDisplayContainer(),
              ],
            ),
            const Spacer(),
            const AddNewReservationConfirmButtons(),
          ],
        ),
      ),
    );
  }
}
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'startTime'.tr,
                //       style: AppTextStyle.primary16700,
                //     ),
                //     const SelectTimeContainer()
                //   ],
                // ),