// To parse this JSON data, do
//
//     final openSessionModel = openSessionModelFromJson(jsonString);

import 'dart:convert';

OpenSessionModel openSessionModelFromJson(String str) =>
    OpenSessionModel.fromJson(json.decode(str));

String openSessionModelToJson(OpenSessionModel data) =>
    json.encode(data.toJson());

class OpenSessionModel {
  final int? status;
  final String? result;
  final Data? data;

  OpenSessionModel({
    this.status,
    this.result,
    this.data,
  });

  factory OpenSessionModel.fromJson(Map<String, dynamic> json) =>
      OpenSessionModel(
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
  final String? sessionCode;
  final String? openCash;
  final dynamic openNotes;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.sessionCode,
    this.openCash,
    this.openNotes,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sessionCode: json["session_code"],
        openCash: json["open_cash"],
        openNotes: json["open_notes"],
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
        "session_code": sessionCode,
        "open_cash": openCash,
        "open_notes": openNotes,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
