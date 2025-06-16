import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClockController extends GetxController {
  RxString time = ''.obs;
  RxString date = ''.obs;
  @override
  void onInit() {
    super.onInit();
    _updateTime();
    Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateTime(),
    );
  }

  void _updateTime() {
    final now = DateTime.now();
    final localeString = Get.locale?.toString();
    time.value = DateFormat('hh:mm a', localeString).format(now);
    date.value = DateFormat('EEEE, d MMMM, y', localeString).format(now);
  }
}
