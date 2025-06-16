// To parse this JSON data, do
//
//     final kitchenNotesModel = kitchenNotesModelFromJson(jsonString);

import 'dart:convert';

KitchenNotesModel kitchenNotesModelFromJson(String str) =>
    KitchenNotesModel.fromJson(json.decode(str));

String kitchenNotesModelToJson(KitchenNotesModel data) =>
    json.encode(data.toJson());

class KitchenNotesModel {
  final int? status;
  final String? result;
  final Data? data;

  KitchenNotesModel({
    this.status,
    this.result,
    this.data,
  });

  factory KitchenNotesModel.fromJson(Map<String, dynamic> json) =>
      KitchenNotesModel(
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
  final String? orderId;
  final String? orderNo;
  final String? kitchenType;
  final String? kitchenNotes;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.orderId,
    this.orderNo,
    this.kitchenType,
    this.kitchenNotes,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderId: json["order_id"],
        orderNo: json["order_no"],
        kitchenType: json["kitchen_type"],
        kitchenNotes: json["kitchen_notes"],
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
        "order_id": orderId,
        "order_no": orderNo,
        "kitchen_type": kitchenType,
        "kitchen_notes": kitchenNotes,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
