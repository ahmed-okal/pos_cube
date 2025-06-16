import '../../../../core/services/use_case.dart';

class AvailableReservationEntity extends Param {
  String seatsNo;
  String reservationDate;
  AvailableReservationEntity({
    required super.loading,
    required this.seatsNo,
    required this.reservationDate,
  });
  Map<String, dynamic> toJson() {
    return {
      "seats_no": seatsNo,
      "reservation_date": reservationDate,
    };
  }
}
