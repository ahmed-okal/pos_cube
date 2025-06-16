import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxBool showCalendar = false.obs;

  void nextDay() {
    selectedDate.value = selectedDate.value.add(const Duration(days: 1));
    _notifyDateChanged();
  }

  void previousDay() {
    selectedDate.value = selectedDate.value.subtract(const Duration(days: 1));
    _notifyDateChanged();
  }

  void toggleCalendar() {
    showCalendar.value = !showCalendar.value;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
    showCalendar.value = false;
    _notifyDateChanged();
  }

  void _notifyDateChanged() {
    // Notify that the date has changed
    update();
  }

  String get formattedDate {
    // existing localized long format
    final String locale =
        Get.locale == const Locale('ar', 'EG') ? 'ar_EG' : 'en_US';
    return DateFormat('EEE, dd MMMM yyyy', locale).format(selectedDate.value);
  }

  /// New ISO-style yyyy-MM-dd (e.g. "2025-05-04")
  String get isoDate => DateFormat('yyyy-MM-dd').format(selectedDate.value);
}
