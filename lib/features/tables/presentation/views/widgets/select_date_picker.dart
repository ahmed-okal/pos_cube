import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/available_reservation_controller.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/add_new_reservation_controller.dart';
import '../../getx/controllers/add_new_reservation_date_picker_controller.dart';
import '../../getx/controllers/time_picker_controller.dart';

class SelectDatePicker extends StatelessWidget {
  const SelectDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final availableController = Get.find<AvailableReservationController>();
    final addNewController = Get.find<AddNewReservationController>();
    final datePickerController =
        Get.find<AddNewReservationDatePickerController>();
    final timePickerController = Get.find<TimePickerController>();

    return Obx(
      () => AnimatedContainer(
        padding: EdgeInsets.symmetric(
          vertical: AppSize.height(14),
          horizontal: AppSize.width(26),
        ),
        duration: const Duration(milliseconds: 300),
        width: AppSize.width(299),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            width: 1.5,
            color: AppColors.primaryWithOpacity2,
          ),
        ),
        child: Column(
          children: [
            TableCalendar(
              // Set the locale based on the app's current language
              locale:
                  Get.locale == const Locale('ar', 'EG') ? 'ar_EG' : 'en_US',
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: Get.locale == const Locale('ar', 'EG')
                    ? AppTextStyle.primary10800
                    : AppTextStyle.primary12700,
                weekendStyle: AppTextStyle.primary12700,
              ),
              rowHeight: AppSize.height(35),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2040, 12, 31),
              focusedDay: datePickerController.selectedDate.value,
              calendarFormat: CalendarFormat.month,
              selectedDayPredicate: (day) =>
                  isSameDay(datePickerController.selectedDate.value, day),
              onDaySelected: (selectedDay, focusedDay) {
                datePickerController.selectDate(selectedDay);

                // Update the available reservations with new date
                availableController.getAvailableReservation(
                  numOfGuests: addNewController.noOfGusts.text,
                  isoDateOnly: datePickerController.isoDateOnly,
                  formattedStartTime24:
                      timePickerController.formattedStartTime24,
                );
              },
              headerStyle: HeaderStyle(
                formatButtonShowsNext: false,
                formatButtonVisible: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
                titleTextStyle: AppTextStyle.primary16800,
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: AppTextStyle.primary12700,
                weekendTextStyle: AppTextStyle.primary12700,
                disabledTextStyle: AppTextStyle.primary12700,
                outsideTextStyle: AppTextStyle.lavenderGray11600,
                todayDecoration: const BoxDecoration(
                  color: AppColors.primaryWithOpacity2,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: AppColors.seafoamBlue,
                  shape: BoxShape.circle,
                ),
                todayTextStyle: AppTextStyle.primary12700,
                selectedTextStyle: AppTextStyle.primary12700,
                markerSize: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
