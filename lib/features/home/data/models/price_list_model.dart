// To parse this JSON data, do
//
//     final priceListModel = priceListModelFromJson(jsonString);

import 'dart:convert';

PriceListModel priceListModelFromJson(String str) =>
    PriceListModel.fromJson(json.decode(str));

String priceListModelToJson(PriceListModel data) => json.encode(data.toJson());

class PriceListModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  PriceListModel({
    this.status,
    this.message,
    this.data,
  });

  factory PriceListModel.fromJson(Map<String, dynamic> json) => PriceListModel(
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
  final int? id;
  final String? name;
  final bool? isActive;
  final String? branchId;
  final String? companyId;
  final String? tenantId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Item>? items;

  Datum({
    this.id,
    this.name,
    this.isActive,
    this.branchId,
    this.companyId,
    this.tenantId,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        isActive: json["is_active"],
        branchId: json["branch_id"],
        companyId: json["company_id"],
        tenantId: json["tenant_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_active": isActive,
        "branch_id": branchId,
        "company_id": companyId,
        "tenant_id": tenantId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final int? id;
  final int? listPriceId;
  final String? productId;
  final String? productName;
  final String? productSalePrice;
  final String? branchId;
  final String? companyId;
  final String? tenantId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Item({
    this.id,
    this.listPriceId,
    this.productId,
    this.productName,
    this.productSalePrice,
    this.branchId,
    this.companyId,
    this.tenantId,
    this.createdAt,
    this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        listPriceId: json["list_price_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        productSalePrice: json["product_sale_price"],
        branchId: json["branch_id"],
        companyId: json["company_id"],
        tenantId: json["tenant_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "list_price_id": listPriceId,
        "product_id": productId,
        "product_name": productName,
        "product_sale_price": productSalePrice,
        "branch_id": branchId,
        "company_id": companyId,
        "tenant_id": tenantId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
