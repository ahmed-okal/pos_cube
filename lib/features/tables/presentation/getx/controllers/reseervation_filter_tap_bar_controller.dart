import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/reservations_controller.dart';

class ReseervationFilterTapBarController extends GetxController {
  final RxInt reservationTap = 0.obs;

  /// 0 = All, 1 = New, 2 = Complete, 3 = Cancel
  int? get selectedStatus {
    switch (reservationTap.value) {
      case 1:
        return 1; // New
      case 2:
        return 10; // Complete
      case 3:
        return 11; // Canceled
      default:
        return null; // All
    }
  }

  final reservationsCtrl = Get.find<ReservationsController>();

  void setReservationTap(int index) {
    reservationTap.value = index;

    // tell ReservationsController to refilter
    reservationsCtrl.applyStatusFilter(selectedStatus);
  }
}
