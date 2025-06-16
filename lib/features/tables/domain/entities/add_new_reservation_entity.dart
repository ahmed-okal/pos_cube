import '../../../../core/services/use_case.dart';

class AddNewReservationEntity extends Param {
  int customerId, noOfGusts, tableId;
  String tableCode,
      customerName,
      reservationStart,
      reservationEnd,
      reservationDate,
      tenantId,
      companyId,
      branchId,
      createdBy;
  AddNewReservationEntity({
    required super.loading,
    required this.tableId,
    required this.tableCode,
    required this.noOfGusts,
    required this.customerId,
    required this.customerName,
    required this.reservationStart,
    required this.reservationEnd,
    required this.reservationDate,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required this.createdBy,
  });
  Map<String, dynamic> toJson() {
    return {
      "table_id": tableId,
      "table_code": tableCode,
      "no_of_gusts": noOfGusts,
      "customer_id": customerId,
      "customer_name": customerName,
      "reservation_starting": reservationStart,
      "reservation_ending": reservationEnd,
      "reservation_date": reservationDate,
      "tenantId": tenantId,
      "companyId": companyId,
      "branchId": branchId,
      "created_by": createdBy,
    };
  }
}
