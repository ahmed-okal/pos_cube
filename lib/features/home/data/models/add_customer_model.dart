// To parse this JSON data, do
//
//     final addCustomerModel = addCustomerModelFromJson(jsonString);

import 'dart:convert';

AddCustomerModel addCustomerModelFromJson(String str) =>
    AddCustomerModel.fromJson(json.decode(str));

String addCustomerModelToJson(AddCustomerModel data) =>
    json.encode(data.toJson());

class AddCustomerModel {
  final int? status;
  final String? message;
  final Data? data;

  AddCustomerModel({
    this.status,
    this.message,
    this.data,
  });

  factory AddCustomerModel.fromJson(Map<String, dynamic> json) =>
      AddCustomerModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Fullname>? fullname;
  final dynamic customerClassId;
  final List<dynamic>? customerGroupsIds;
  final dynamic customerStatusId;
  final List<CustomerAddress>? customerAddresses;
  final List<dynamic>? responsibles;
  final bool? isActive;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Data({
    this.fullname,
    this.customerClassId,
    this.customerGroupsIds,
    this.customerStatusId,
    this.customerAddresses,
    this.responsibles,
    this.isActive,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullname: json["fullname"] == null
            ? []
            : List<Fullname>.from(
                json["fullname"]!.map((x) => Fullname.fromJson(x))),
        customerClassId: json["customerClassId"],
        customerGroupsIds: json["customerGroupsIds"] == null
            ? []
            : List<dynamic>.from(json["customerGroupsIds"]!.map((x) => x)),
        customerStatusId: json["customerStatusId"],
        customerAddresses: json["customerAddresses"] == null
            ? []
            : List<CustomerAddress>.from(json["customerAddresses"]!
                .map((x) => CustomerAddress.fromJson(x))),
        responsibles: json["responsibles"] == null
            ? []
            : List<dynamic>.from(json["responsibles"]!.map((x) => x)),
        isActive: json["isActive"],
        tenantId: json["tenantId"],
        companyId: json["companyId"],
        branchId: json["branchId"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname == null
            ? []
            : List<dynamic>.from(fullname!.map((x) => x.toJson())),
        "customerClassId": customerClassId,
        "customerGroupsIds": customerGroupsIds == null
            ? []
            : List<dynamic>.from(customerGroupsIds!.map((x) => x)),
        "customerStatusId": customerStatusId,
        "customerAddresses": customerAddresses == null
            ? []
            : List<dynamic>.from(customerAddresses!.map((x) => x.toJson())),
        "responsibles": responsibles == null
            ? []
            : List<dynamic>.from(responsibles!.map((x) => x)),
        "isActive": isActive,
        "tenantId": tenantId,
        "companyId": companyId,
        "branchId": branchId,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class CustomerAddress {
  final String? name;
  final String? city;
  final String? region;
  final String? street;
  final String? desc;
  final String? id;

  CustomerAddress({
    this.name,
    this.city,
    this.region,
    this.street,
    this.desc,
    this.id,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      CustomerAddress(
        name: json["name"],
        city: json["city"],
        region: json["region"],
        street: json["street"],
        desc: json["desc"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
        "region": region,
        "street": street,
        "desc": desc,
        "_id": id,
      };
}

class Fullname {
  final String? text;
  final String? lang;
  final String? id;

  Fullname({
    this.text,
    this.lang,
    this.id,
  });

  factory Fullname.fromJson(Map<String, dynamic> json) => Fullname(
        text: json["text"],
        lang: json["lang"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "lang": lang,
        "_id": id,
      };
}
