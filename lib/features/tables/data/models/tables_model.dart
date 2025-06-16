// To parse this JSON data, do
//
//     final tablesModel = tablesModelFromJson(jsonString);

import 'dart:convert';

TablesModel tablesModelFromJson(String str) =>
    TablesModel.fromJson(json.decode(str));

String tablesModelToJson(TablesModel data) => json.encode(data.toJson());

class TablesModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  TablesModel({
    this.status,
    this.message,
    this.data,
  });

  factory TablesModel.fromJson(Map<String, dynamic> json) => TablesModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? nameAr;
  final String? nameEn;
  final int? status;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? id;
  final List<Table>? tables;

  Datum({
    this.nameAr,
    this.nameEn,
    this.status,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.tables,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        status: json["status"],
        tenantId: json["tenant_id"],
        companyId: json["company_id"],
        branchId: json["branch_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        id: json["id"],
        tables: json["tables"] == null
            ? []
            : List<Table>.from(json["tables"]!.map((x) => Table.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name_ar": nameAr,
        "name_en": nameEn,
        "status": status,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "id": id,
        "tables": tables == null
            ? []
            : List<dynamic>.from(tables!.map((x) => x.toJson())),
      };
}

class Table {
  final int? id;
  final String? tableCode;
  final int? noOfSeats;
  final int? status;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? tablePlaceId;

  Table({
    this.id,
    this.tableCode,
    this.noOfSeats,
    this.status,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.tablePlaceId,
  });

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        id: json["id"],
        tableCode: json["table_code"],
        noOfSeats: json["no_of_seats"],
        status: json["status"],
        tenantId: json["tenant_id"],
        companyId: json["company_id"],
        branchId: json["branch_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        tablePlaceId: json["table_place_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "table_code": tableCode,
        "no_of_seats": noOfSeats,
        "status": status,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "table_place_id": tablePlaceId,
      };
}
