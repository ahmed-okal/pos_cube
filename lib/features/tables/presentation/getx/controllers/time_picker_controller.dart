import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimePickerController extends GetxController {
  final Rx<TimeOfDay> selectedStartTime = TimeOfDay.now().obs;

  /// 12-hour format using intl (e.g. "11:30 PM")
  String get formattedStartTime12 {
    final tod = selectedStartTime.value;
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final String locale = Get.locale?.languageCode == 'ar' ? 'ar_EG' : 'en_US';
    return DateFormat.jm(locale).format(dateTime);
  }

  /// 24-hour format "HH:mm" (e.g. "23:05" or "08:09")
  String get formattedStartTime24 {
    final tod = selectedStartTime.value;
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    return DateFormat('HH:mm').format(dateTime);
  }
}
