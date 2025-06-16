import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/utils/size_utils.dart';
import '../../getx/controllers/tables_controller.dart';

class CustomCalendar extends GetView<TablesController> {
  const CustomCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: controller.datePickerController.showCalendar.value
            ? AppSize.height(350)
            : 0,
        curve: Curves.easeInOut,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            margin: EdgeInsets.only(
              top: AppSize.height(0),
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TableCalendar(
              // Set the locale based on the app's current language
              locale: Get.locale?.languageCode == 'ar' ? 'ar_EG' : 'en_US',
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2050, 12, 31),
              focusedDay: controller.datePickerController.selectedDate.value,
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) {
                return isSameDay(
                  controller.datePickerController.selectedDate.value,
                  day,
                );
              },
              onDaySelected: (selectedDay, focusedDay) {
                controller.datePickerController.selectDate(selectedDay);
                controller.reservationsController.getReservations();
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: AppTextStyle.primary16800,
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  size: getSize(24),
                  color: AppColors.primaryColor,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  size: getSize(24),
                  color: AppColors.primaryColor,
                ),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: AppColors.seafoamBlue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: AppColors.primaryWithOpacity2,
                  shape: BoxShape.circle,
                ),
                markersMaxCount: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
