import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../data/models/reservations_model.dart';
import '../../../domain/entities/reservations_entity.dart';
import '../../../domain/use_case/reservations_use_case.dart';
import '../controllers/date_picker_controller.dart';

class ReservationsController extends GetxController {
  // Injected controllers & use case
  final DatePickerController datePickerController =
      Get.find<DatePickerController>();
  final ReservationsUseCase reservationsUseCase;
  ReservationsController(this.reservationsUseCase);
  final TextEditingController tableCode = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final RxList<ReservationsModel> _allReservations = <ReservationsModel>[].obs;

  // Use getters to calculate counts dynamically from _allReservations
  int get allCount => _allReservations.length;
  int get newCount => _allReservations.where((r) => r.status == 1).length;
  int get completedCount =>
      _allReservations.where((r) => r.status == 10).length;
  int get canceledCount => _allReservations.where((r) => r.status == 11).length;
  final RxList<ReservationsModel> filteredReservations =
      <ReservationsModel>[].obs;

  /// Current status filter: null = all, else a status code
  final RxnInt statusFilter = RxnInt();

  /// Optional loading indicator
  final loading = true.obs;

  @override
  void onInit() {
    super.onInit();

    // Whenever the user types, re-run the filter
    searchController.addListener(() {
      filterReservations(searchController.text);
    });

    // Whenever the status tab changes, re-run the filter
    ever(statusFilter, (_) => _filter());

    // Listen to date changes and refresh data
    ever(datePickerController.selectedDate, (_) {
      getReservations();
    });

    // Initial data load
    getReservations();
  }

  Future<void> getReservations() async {
    loading.value = true;
    final result = await reservationsUseCase(
      ReservationsEntity(
        loading: loading,
        tableCode: tableCode.text,
        reservationDate: datePickerController.isoDate,
      ),
    );
    result.fold(
      (failure) {
        String errorMessage;
        if (failure is ServerFailure) {
          if (failure.message.contains('500')) {
            errorMessage = 'serverErrorPleaseTryAgainLater'.tr;
          } else {
            errorMessage = failure.message;
          }
        } else if (failure is AppExceptions) {
          errorMessage = failure.message;
        } else {
          errorMessage = 'somethingWentWrongPleaseTryAgainLater'.tr;
        }
        failedSnaskBar(errorMessage);
        // Clear the filtered list on error
        filteredReservations.clear();
        _allReservations.clear();
      },
      (data) {
        _allReservations.assignAll(data);
        _filter(); // Apply current filters
      },
    );
    loading.value = false;
  }

  /// Called by the tap-bar controller to set a status filter (null = all)
  void applyStatusFilter(int? status) {
    statusFilter.value = status;
  }

  /// Called on every keystroke in your search field
  void filterReservations(String searchText) {
    _filter(searchText: searchText);
  }

  /// Private: combines name + status filters
  void _filter({String? searchText}) {
    var filtered = List<ReservationsModel>.from(_allReservations);

    // Apply search filter if text is provided
    if (searchText != null && searchText.isNotEmpty) {
      filtered = filtered.where((r) {
        final name = r.customerName?.toLowerCase() ?? '';
        final tableCode = r.tableCode?.toLowerCase() ?? '';
        final searchLower = searchText.toLowerCase();
        return name.contains(searchLower) || tableCode.contains(searchLower);
      }).toList();
    }

    // Apply status filter
    if (statusFilter.value != null) {
      filtered = filtered.where((r) => r.status == statusFilter.value).toList();
    }

    filteredReservations.assignAll(filtered);
  }
}
