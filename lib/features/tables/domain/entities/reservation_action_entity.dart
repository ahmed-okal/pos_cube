import '../../../../core/services/use_case.dart';

class ReservationActionEntity extends Param {
  int reservationId;
  String action;
  ReservationActionEntity({
    required super.loading,
    required this.reservationId,
    required this.action,
  });
}
