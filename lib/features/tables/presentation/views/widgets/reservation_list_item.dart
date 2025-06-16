import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../getx/controllers/reservations_controller.dart';

class ReservationListItem extends GetView<ReservationsController> {
  const ReservationListItem({
    super.key,
    required this.tableCode,
    required this.reservationName,
    required this.numberOfGuest,
    required this.reservationTimeStart,
    required this.finishReservationTap,
    required this.cancelReservationTap,
    required this.reservationColor,
  });
  final Color reservationColor;
  final VoidCallback finishReservationTap, cancelReservationTap;
  final String tableCode, reservationName, numberOfGuest, reservationTimeStart;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(
        horizontal: AppSize.width(20),
      ),
      height: AppSize.height(65),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.third,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppSize.width(8),
              vertical: AppSize.height(9),
            ),
            height: AppSize.height(45),
            width: AppSize.height(61),
            decoration: BoxDecoration(
              color: reservationColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                tableCode.trim(),
                style: AppTextStyle.primary12700,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'reservedBy'.tr,
                style: AppTextStyle.primary8800,
              ),
              Text(
                reservationName.trim(),
                style: AppTextStyle.primary12800,
              ),
              SizedBox(
                height: AppSize.height(2),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.peopleIcon,
                    height: AppSize.height(9),
                  ),
                  SizedBox(
                    width: AppSize.width(1),
                  ),
                  Text(
                    numberOfGuest.trim(),
                    style: AppTextStyle.primary8700,
                  ),
                  SizedBox(
                    width: AppSize.width(9),
                  ),
                  CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColors.green,
                    child: Center(
                      child: Icon(
                        Icons.done_rounded,
                        color: AppColors.white,
                        size: getSize(7),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppSize.width(1),
                  ),
                  Text(
                    'payment'.tr,
                    style: AppTextStyle.primary8800,
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  itemBuilder: (context) => [
                    PopupMenuItem<String>(
                      onTap: finishReservationTap,
                      child: Text('finishReservation'.tr),
                    ),
                    PopupMenuItem<String>(
                      onTap: cancelReservationTap,
                      child: Text('cancelReservation'.tr),
                    ),
                  ],
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: AppSize.height(5),
                      end: AppSize.width(5),
                    ),
                    child: Icon(
                      Icons.more_vert,
                      color: AppColors.primaryColor,
                      size: getSize(18),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Container(
                  height: AppSize.height(19),
                  width: AppSize.width(61),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(8),
                      bottomEnd: Radius.circular(8),
                    ),
                    color: AppColors.third,
                  ),
                  child: Center(
                    child: Text(
                      reservationTimeStart,
                      style: AppTextStyle.primary12800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
