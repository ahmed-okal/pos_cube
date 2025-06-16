// To parse this JSON data, do
//
//     final paymentMethodsModel = paymentMethodsModelFromJson(jsonString);

import 'dart:convert';

PaymentMethodsModel paymentMethodsModelFromJson(String str) =>
    PaymentMethodsModel.fromJson(json.decode(str));

String paymentMethodsModelToJson(PaymentMethodsModel data) =>
    json.encode(data.toJson());

class PaymentMethodsModel {
  final int? id;
  final bool? isActive;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Description>? description;

  PaymentMethodsModel({
    this.id,
    this.isActive,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.description,
  });

  factory PaymentMethodsModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodsModel(
        id: json["id"],
        isActive: json["is_active"],
        tenantId: json["tenant_id"],
        companyId: json["company_id"],
        branchId: json["branch_id"],
        createdBy: json["created_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        description: json["description"] == null
            ? []
            : List<Description>.from(
                json["description"]!.map((x) => Description.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_active": isActive,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "description": description == null
            ? []
            : List<dynamic>.from(description!.map((x) => x.toJson())),
      };
}

class Description {
  final int? id;
  final int? paymentMethodId;
  final String? name;
  final String? desc;
  final String? lang;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Description({
    this.id,
    this.paymentMethodId,
    this.name,
    this.desc,
    this.lang,
    this.createdAt,
    this.updatedAt,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        id: json["id"],
        paymentMethodId: json["payment_method_id"],
        name: json["name"],
        desc: json["desc"],
        lang: json["lang"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_method_id": paymentMethodId,
        "name": name,
        "desc": desc,
        "lang": lang,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
