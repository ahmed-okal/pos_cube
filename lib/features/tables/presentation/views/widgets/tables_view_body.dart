import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/reservation_section.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/tables_right_side.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../getx/controllers/tables_controller.dart';

class TablesViewBody extends GetView<TablesController> {
  const TablesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.isTrue
          ? const LoadingWidget()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReservationSection(),
                TablesRightSide(
                  margin: EdgeInsetsDirectional.only(
                    top: AppSize.height(14),
                    start: AppSize.width(31),
                    end: AppSize.width(50),
                    bottom: AppSize.height(10),
                  ),
                ),
              ],
            ),
    );
  }
}
