// To parse this JSON data, do
//
//     final addNewReservationModel = addNewReservationModelFromJson(jsonString);

import 'dart:convert';

AddNewReservationModel addNewReservationModelFromJson(String str) =>
    AddNewReservationModel.fromJson(json.decode(str));

String addNewReservationModelToJson(AddNewReservationModel data) =>
    json.encode(data.toJson());

class AddNewReservationModel {
  final int? tableId;
  final String? tableCode;
  final int? noOfGusts;
  final int? customerId;
  final String? customerName;
  final String? reservationStarting;
  final String? reservationEnding;
  final DateTime? reservationDate;
  final int? status;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  AddNewReservationModel({
    this.tableId,
    this.tableCode,
    this.noOfGusts,
    this.customerId,
    this.customerName,
    this.reservationStarting,
    this.reservationEnding,
    this.reservationDate,
    this.status,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory AddNewReservationModel.fromJson(Map<String, dynamic> json) =>
      AddNewReservationModel(
        tableId: json["table_id"],
        tableCode: json["table_code"],
        noOfGusts: json["no_of_gusts"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        reservationStarting: json["reservation_starting"],
        reservationEnding: json["reservation_ending"],
        reservationDate: json["reservation_date"] == null
            ? null
            : DateTime.parse(json["reservation_date"]),
        status: json["status"],
        tenantId: json["tenant_id"],
        companyId: json["company_id"],
        branchId: json["branch_id"],
        createdBy: json["created_by"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "table_id": tableId,
        "table_code": tableCode,
        "no_of_gusts": noOfGusts,
        "customer_id": customerId,
        "customer_name": customerName,
        "reservation_starting": reservationStarting,
        "reservation_ending": reservationEnding,
        "reservation_date":
            "${reservationDate!.year.toString().padLeft(4, '0')}-${reservationDate!.month.toString().padLeft(2, '0')}-${reservationDate!.day.toString().padLeft(2, '0')}",
        "status": status,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
