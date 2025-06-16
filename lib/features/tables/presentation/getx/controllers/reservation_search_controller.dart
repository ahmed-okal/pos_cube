import 'package:get/get.dart';

class ReservationSearchController extends GetxController {
  // /// Full list of reservations to filter
  // List<ReservationsModel> _allReservations = [];

  // /// Observable search query
  // final RxString _query = ''.obs;

  // /// Filtered list based on search query
  // final filteredReservations = <ReservationsModel>[].obs;

  // /// Text editing controller for user input
  // final TextEditingController searchController = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  //   // Listen to text changes and debounce the query
  //   searchController.addListener(() {
  //     _query.value = searchController.text.trim().toLowerCase();
  //   });
  //   debounce(
  //     _query,
  //     (_) => _filterReservations(),
  //     time: const Duration(milliseconds: 300),
  //   );
  // }

  // @override
  // void onClose() {
  //   searchController.dispose();
  //   super.onClose();
  // }

  // /// Initialize with the full reservations list
  // void setInitialData(List<ReservationsModel> allReservations) {
  //   _allReservations = allReservations;
  //   filteredReservations.assignAll(_allReservations);
  // }

  // /// Perform search filter on table code or customer name
  // void _filterReservations() {
  //   final query = _query.value;
  //   if (query.isEmpty) {
  //     filteredReservations.assignAll(_allReservations);
  //   } else {
  //     final results = _allReservations.where((res) {
  //       final table = res.tableCode?.toLowerCase() ?? '';
  //       final name = res.customerName?.toLowerCase() ?? '';
  //       return table.contains(query) || name.contains(query);
  //     }).toList();
  //     filteredReservations.assignAll(results);
  //   }
  // }
}
