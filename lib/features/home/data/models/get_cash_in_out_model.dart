// To parse this JSON data, do
//
//     final getCashInOutModel = getCashInOutModelFromJson(jsonString);

import 'dart:convert';

GetCashInOutModel getCashInOutModelFromJson(String str) =>
    GetCashInOutModel.fromJson(json.decode(str));

String getCashInOutModelToJson(GetCashInOutModel data) =>
    json.encode(data.toJson());

class GetCashInOutModel {
  final int? status;
  final String? result;
  final List<Datum>? data;

  GetCashInOutModel({
    this.status,
    this.result,
    this.data,
  });

  factory GetCashInOutModel.fromJson(Map<String, dynamic> json) =>
      GetCashInOutModel(
        status: json["status"] as int?,
        result: json["result"] as String?,
        data: json["data"] == null
            ? []
            : List<Datum>.from(
                (json["data"] as List).map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final int? sessionId;
  final String cashType;
  final double cashAmount;
  final String? cashReasons;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.sessionId,
    required this.cashType,
    required this.cashAmount,
    this.cashReasons,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    // raw values
    final rawType = json["cash_type"]?.toString() ?? '';
    final rawAmt = json["cash_amount"]?.toString() ?? '';

    return Datum(
      id: json["id"] as int?,
      sessionId: json["session_id"] as int?,
      cashType: rawType.trim().toLowerCase(), // normalized
      cashAmount: double.tryParse(rawAmt.trim()) ?? 0.0,
      cashReasons: json["cash_reasons"] as String?,
      tenantId: json["tenant_id"] as String?,
      companyId: json["company_id"] as String?,
      branchId: json["branch_id"] as String?,
      createdBy: json["created_by"] as String?,
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"] as String),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "session_id": sessionId,
        "cash_type": cashType,
        // output as string so API sees the same format
        "cash_amount": cashAmount.toString(),
        "cash_reasons": cashReasons,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
