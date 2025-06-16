import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/available_reservation_controller.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../getx/controllers/add_new_reservation_controller.dart';

class TableDisplayContainer extends StatelessWidget {
  const TableDisplayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final availableController = Get.find<AvailableReservationController>();
    final addNewController = Get.find<AddNewReservationController>();

    return Expanded(
      // This gives the container defined dimensions
      child: Obx(
        () {
          if (availableController.loading.isTrue) {
            return Container(
              alignment: Alignment.center,
              child: const LoadingWidget(),
            );
          } else if (addNewController.noOfGusts.text.isEmpty ||
              availableController.availableReservationModels.data?.isEmpty ==
                  true) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                'noAvailableTables'.tr,
                style: AppTextStyle.primary16700,
              ),
            );
          } else {
            return const TableDisplayContainerBody();
          }
        },
      ),
    );
  }
}

class TableDisplayContainerBody
    extends GetView<AvailableReservationController> {
  const TableDisplayContainerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'table'.tr,
          style: AppTextStyle.primary16700,
        ),
        AvailableTableTabBar(),
        SizedBox(
          width: AppSize.width(347),
          child: Center(
            child: AvailableTableContainerImage(),
          ),
        ),
        TableSlotsPageView(),
      ],
    );
  }
}

class AvailableTableTabBar extends GetView<AvailableReservationController> {
  const AvailableTableTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(33),
      width: AppSize.width(347),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.availableReservationModels.data?.length ?? 0,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: AppSize.width(6),
          );
        },
        itemBuilder: (context, index) {
          final model = controller.availableReservationModels.data?[index];
          return InkWell(
            onTap: () {
              controller.setSelectedAvailableReservation(index);
            },
            child: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: AppSize.height(33),
                width: AppSize.width(60),
                decoration: BoxDecoration(
                  color: controller.selectedAvailableReservation.value == index
                      ? AppColors.primaryColor
                      : AppColors.white,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                      model?.tableDetails?.tableCode?.trim() ?? 'No Table Code',
                      style:
                          controller.selectedAvailableReservation.value == index
                              ? AppTextStyle.white12800
                              : AppTextStyle.primary12800),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AvailableTableContainerImage
    extends GetView<AvailableReservationController> {
  const AvailableTableContainerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.height(8),
      ),
      child: Obx(() {
        final selectedIndex = controller.selectedAvailableReservation.value;
        final table =
            controller.availableReservationModels.data?.isNotEmpty == true &&
                    selectedIndex <
                        controller.availableReservationModels.data!.length
                ? controller.availableReservationModels.data![selectedIndex]
                    .tableDetails
                : null;

        return Container(
          height: AppSize.height(120),
          width: AppSize.width(180),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Image.asset(
            controller.getTableImage(
              table?.noOfSeats,
              table?.status,
            ),
            key: ValueKey('table_image_$selectedIndex'),
          ),
        );
      }),
    );
  }
}

class TableSlotsPageView extends GetView<AvailableReservationController> {
  const TableSlotsPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(100),
      width: AppSize.width(347),
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        itemCount: controller.availableReservationModels.data?.length,
        itemBuilder: (context, index) {
          return TableSlotsGridView();
        },
      ),
    );
  }
}

class TableSlotsGridView extends GetView<AvailableReservationController> {
  const TableSlotsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2.4,
        mainAxisSpacing: AppSize.height(10),
        crossAxisSpacing: AppSize.width(6),
      ),
      itemCount: controller
              .availableReservationModels
              .data?[controller.selectedAvailableReservation.value]
              .slots
              ?.length ??
          0,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            controller.setSelectedTimeSlot(index);
          },
          child: Obx(() {
            final data = controller.availableReservationModels.data;
            final selectedIndex = controller.selectedAvailableReservation.value;
            final slots = (data != null && selectedIndex < data.length)
                ? data[selectedIndex].slots
                : null;

            if (slots == null || slots.isEmpty || index >= slots.length) {
              return const SizedBox(); // Safe fallback widget
            }

            final isSelected = controller.selectedTimeSlot.value == index;

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: isSelected ? AppColors.primaryColor : AppColors.white,
                border: Border.all(
                  color: AppColors.primaryColor,
                ),
              ),
              child: Center(
                child: Text(
                  "${slots[index].slotStartTime.toString()} ${'to'.tr} ${slots[index].slotEndTime.toString()}",
                  style: isSelected
                      ? AppTextStyle.white12800
                      : AppTextStyle.primary12800,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
    // (() {
                  //   final slotValue = availableController
                  //       .availableReservationModels[
                  //           availableController
                  //               .selectedAvailableReservation
                  //               .value]
                  //       .slots;
                  //   if (slotValue is List) {
                  //     return (slotValue).join(', ');
                  //   } else {
                  //     return slotValue?.toString() ??
                  //         'No Table Code';
                  //   }
                  // })(),