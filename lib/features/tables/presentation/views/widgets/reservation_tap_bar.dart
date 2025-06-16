import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/reseervation_filter_tap_bar_controller.dart';

class ReservationTapBar extends GetView<ReseervationFilterTapBarController> {
  const ReservationTapBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: AppSize.height(27),
        bottom: AppSize.height(11),
      ),
      child: SizedBox(
        height: AppSize.height(27),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: tabBarList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: AppSize.width(8),
            );
          },
          itemBuilder: (BuildContext context, int index) {
            final count = [
              controller.reservationsCtrl.allCount,
              controller.reservationsCtrl.newCount,
              controller.reservationsCtrl.completedCount,
              controller.reservationsCtrl.canceledCount,
            ][index];
            return Obx(
              () => InkWell(
                onTap: () => controller.setReservationTap(index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  width: AppSize.width(80),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.primaryColor,
                    ),
                    color: controller.reservationTap.value == index
                        ? AppColors.primaryColor
                        : AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tabBarList[index],
                        style: controller.reservationTap.value == index
                            ? AppTextStyle.white12600
                            : AppTextStyle.primary12700,
                      ),
                      SizedBox(
                        width: AppSize.width(5),
                      ),
                      CircleAvatar(
                        radius: AppSize.height(7.5),
                        backgroundColor:
                            controller.reservationTap.value == index
                                ? AppColors.white
                                : AppColors.primaryColor,
                        child: Center(
                          child: Obx(() => Text(
                                '$count',
                                style: controller.reservationTap.value == index
                                    ? AppTextStyle.primary8800
                                    : AppTextStyle.white8800,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<String> tabBarList = [
  'all'.tr,
  'new'.tr,
  'completed'.tr,
  'canceled'.tr,
];
