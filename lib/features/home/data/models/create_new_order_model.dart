// To parse this JSON data, do
//
//     final createNewOrderModel = createNewOrderModelFromJson(jsonString);

import 'dart:convert';

CreateNewOrderModel createNewOrderModelFromJson(String str) =>
    CreateNewOrderModel.fromJson(json.decode(str));

String createNewOrderModelToJson(CreateNewOrderModel data) =>
    json.encode(data.toJson());

class CreateNewOrderModel {
  final int? status;
  final String? result;
  final Data? data;

  CreateNewOrderModel({
    this.status,
    this.result,
    this.data,
  });

  factory CreateNewOrderModel.fromJson(Map<String, dynamic> json) =>
      CreateNewOrderModel(
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
  final String? tableId;
  final int? orderNo;
  final DateTime? orderDate;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.tableId,
    this.orderNo,
    this.orderDate,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tableId: json["table_id"],
        orderNo: json["order_no"],
        orderDate: json["order_date"] == null
            ? null
            : DateTime.parse(json["order_date"]),
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
        "order_no": orderNo,
        "order_date": orderDate?.toIso8601String(),
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
