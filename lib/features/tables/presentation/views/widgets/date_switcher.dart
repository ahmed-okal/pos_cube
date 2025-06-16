import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../getx/controllers/tables_controller.dart';

class DateSwitcher extends GetView<TablesController> {
  const DateSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: getSize(22),
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            controller.datePickerController.previousDay();
            controller.reservationsController.getReservations();
          },
          padding: EdgeInsets.zero,
        ),
        InkWell(
          onTap: () {
            controller.datePickerController.toggleCalendar();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.width(3),
            ),
            child: Obx(
              () {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.2, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    controller.datePickerController.formattedDate,
                    key: ValueKey<String>(
                      controller.datePickerController.formattedDate,
                    ),
                    style: AppTextStyle.primary16600,
                  ),
                );
              },
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.chevron_right,
            size: getSize(22),
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            controller.datePickerController.nextDay();
            controller.reservationsController.getReservations();
          },
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
