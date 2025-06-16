// To parse this JSON data, do
//
//     final payOrderModel = payOrderModelFromJson(jsonString);

import 'dart:convert';

PayOrderModel payOrderModelFromJson(String str) =>
    PayOrderModel.fromJson(json.decode(str));

String payOrderModelToJson(PayOrderModel data) => json.encode(data.toJson());

class PayOrderModel {
  final int? status;
  final List<Datum>? data;

  PayOrderModel({
    this.status,
    this.data,
  });

  factory PayOrderModel.fromJson(Map<String, dynamic> json) => PayOrderModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? type;
  final String? invId;
  final String? invNo;
  final String? amount;
  final String? paymentMethodId;
  final String? notes;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Datum({
    this.type,
    this.invId,
    this.invNo,
    this.amount,
    this.paymentMethodId,
    this.notes,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        invId: json["inv_id"],
        invNo: json["inv_no"],
        amount: json["amount"],
        paymentMethodId: json["payment_method_id"],
        notes: json["notes"],
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
        "type": type,
        "inv_id": invId,
        "inv_no": invNo,
        "amount": amount,
        "payment_method_id": paymentMethodId,
        "notes": notes,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
