import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/add_new_reservation_button.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/reservation_section_container.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/reservation_tap_bar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../getx/controllers/reservations_controller.dart';

class ReservationSection extends GetView<ReservationsController> {
  const ReservationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width(401),
      color: AppColors.lightGreen,
      child: Obx(
        () => controller.loading.isTrue
            ? const LoadingWidget()
            : Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: AppSize.width(50),
                      ),
                      Expanded(
                        child: ReservationTapBar(),
                      ),
                    ],
                  ),
                  const ReservationSectionContainer(),
                  SizedBox(
                    height: AppSize.height(20),
                  ),
                  const AddNewReservationButton(),
                ],
              ),
      ),
    );
  }
}
