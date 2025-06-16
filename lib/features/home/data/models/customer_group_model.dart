// To parse this JSON data, do
//
//     final customersGroupModel = customersGroupModelFromJson(jsonString);

import 'dart:convert';

CustomersGroupModel customersGroupModelFromJson(String str) =>
    CustomersGroupModel.fromJson(json.decode(str));

String customersGroupModelToJson(CustomersGroupModel data) =>
    json.encode(data.toJson());

class CustomersGroupModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  CustomersGroupModel({
    this.status,
    this.message,
    this.data,
  });

  factory CustomersGroupModel.fromJson(Map<String, dynamic> json) =>
      CustomersGroupModel(
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
  final String? id;
  final List<Group>? groupName;
  final List<Group>? groupDesc;
  final bool? isActive;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Datum({
    this.id,
    this.groupName,
    this.groupDesc,
    this.isActive,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        groupName: json["groupName"] == null
            ? []
            : List<Group>.from(
                json["groupName"]!.map((x) => Group.fromJson(x))),
        groupDesc: json["groupDesc"] == null
            ? []
            : List<Group>.from(
                json["groupDesc"]!.map((x) => Group.fromJson(x))),
        isActive: json["isActive"],
        tenantId: json["tenantId"],
        companyId: json["companyId"],
        branchId: json["branchId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "groupName": groupName == null
            ? []
            : List<dynamic>.from(groupName!.map((x) => x.toJson())),
        "groupDesc": groupDesc == null
            ? []
            : List<dynamic>.from(groupDesc!.map((x) => x.toJson())),
        "isActive": isActive,
        "tenantId": tenantId,
        "companyId": companyId,
        "branchId": branchId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Group {
  final String? text;
  final Lang? lang;
  final String? id;

  Group({
    this.text,
    this.lang,
    this.id,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        text: json["text"],
        lang: langValues.map[json["lang"]]!,
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "lang": langValues.reverse[lang],
        "_id": id,
      };
}

enum Lang { ar, en }

final langValues = EnumValues({"ar": Lang.ar, "en": Lang.en});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
