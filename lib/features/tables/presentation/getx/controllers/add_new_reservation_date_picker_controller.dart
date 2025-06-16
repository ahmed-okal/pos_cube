import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddNewReservationDatePickerController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxBool showCalendar = false.obs;

  void nextDay() {
    selectedDate.value = selectedDate.value.add(const Duration(days: 1));
  }

  void previousDay() {
    selectedDate.value = selectedDate.value.subtract(const Duration(days: 1));
  }

  void toggleCalendar() {
    showCalendar.value = !showCalendar.value;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    showCalendar.value = false;
  }

  /// Formats as "dd MMMM yyyy", e.g. "05 May 2025"
  String get formattedDate {
    // Get the current locale from GetX
    final String locale =
        Get.locale == const Locale('ar', 'EG') ? 'ar_EG' : 'en_US';
    return DateFormat('dd MMMM yyyy', locale).format(selectedDate.value);
  }

  /// Returns ISO date only, e.g. "2025-08-23"
  String get isoDateOnly {
    // ISO format is locale-independent
    return DateFormat('yyyy-MM-dd').format(selectedDate.value);
  }

  /// Returns "DD-MM-YYYY", e.g. "06-08-2026"
  String get simpleDate {
    // Simple date format is locale-independent
    return DateFormat('dd-MM-yyyy').format(selectedDate.value);
  }
}
