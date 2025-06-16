import '../../../../core/services/use_case.dart';

class ReservationsEntity extends Param {
  String tableCode;
  String reservationDate;
  ReservationsEntity({
    required super.loading,
    required this.tableCode,
    required this.reservationDate,
  });
  Map<String, dynamic> toJson() {
    return {
      "table_code": tableCode,
      "reservation_date": reservationDate,
    };
  }
}
