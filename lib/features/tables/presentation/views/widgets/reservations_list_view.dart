import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/cancel_reservation_controller.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/complete_reservation_controller.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/reservation_list_item.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/reservations_controller.dart';

class ReservationsListView extends GetView<ReservationsController> {
  const ReservationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final completeController = Get.find<CompleteReservationController>();
    final cancelController = Get.find<CancelReservationController>();

    return Obx(
      () {
        final list = controller.filteredReservations;
        if (list.isEmpty) {
          return Text(
            "there'sNoReservationsForThisDay".tr,
            style: AppTextStyle.primary18700,
          );
        }
        return Expanded(
          child: ListView.separated(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final r = list[index];
              return ReservationListItem(
                reservationColor:
                    r.status == 1 ? AppColors.frostedMint : AppColors.lightPink,
                finishReservationTap: () {
                  completeController.completeReservation(r.id!);
                },
                cancelReservationTap: () {
                  cancelController.cancelReservation(r.id!);
                },
                tableCode: r.tableCode ?? '',
                reservationName: r.customerName ?? '',
                numberOfGuest: r.noOfGusts.toString(),
                reservationTimeStart: r.reservationStarting ?? '',
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: AppSize.height(6)),
          ),
        );
      },
    );
  }
}
