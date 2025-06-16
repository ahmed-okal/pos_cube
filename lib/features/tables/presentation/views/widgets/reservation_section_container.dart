import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/custom_calendar.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/date_switcher.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/reservation_search_text_field.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/reservations_list_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/reservations_controller.dart';

class ReservationSectionContainer extends GetView<ReservationsController> {
  const ReservationSectionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: AppSize.width(50),
        end: AppSize.width(35),
      ),
      width: double.infinity,
      height: AppSize.height(471),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.third,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: const Column(
        children: [
          DateSwitcher(),
          CustomCalendar(),
          ReservationSearchTextField(),
          ReservationsListView(),
        ],
      ),
    );
  }
}
