// To parse this JSON data, do
//
//     final cashInOutModel = cashInOutModelFromJson(jsonString);

import 'dart:convert';

CashInOutModel cashInOutModelFromJson(String str) =>
    CashInOutModel.fromJson(json.decode(str));

String cashInOutModelToJson(CashInOutModel data) => json.encode(data.toJson());

class CashInOutModel {
  final int? status;
  final String? result;
  final Data? data;

  CashInOutModel({
    this.status,
    this.result,
    this.data,
  });

  factory CashInOutModel.fromJson(Map<String, dynamic> json) => CashInOutModel(
        status: json["status"],
        result: json["result"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "data": data?.toJson(),
      };
}

class Data {
  final String? sessionId;
  final String? cashType;
  final String? cashAmount;
  final String? cashReasons;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.sessionId,
    this.cashType,
    this.cashAmount,
    this.cashReasons,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sessionId: json["session_id"],
        cashType: json["cash_type"],
        cashAmount: json["cash_amount"],
        cashReasons: json["cash_reasons"],
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
        "session_id": sessionId,
        "cash_type": cashType,
        "cash_amount": cashAmount,
        "cash_reasons": cashReasons,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
