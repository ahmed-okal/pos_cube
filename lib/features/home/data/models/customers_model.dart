// To parse this JSON data, do
//
//     final customersModel = customersModelFromJson(jsonString);

import 'dart:convert';

CustomersModel customersModelFromJson(String str) =>
    CustomersModel.fromJson(json.decode(str));

String customersModelToJson(CustomersModel data) => json.encode(data.toJson());

class CustomersModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  CustomersModel({
    this.status,
    this.message,
    this.data,
  });

  factory CustomersModel.fromJson(Map<String, dynamic> json) => CustomersModel(
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
  final List<Fullname>? fullname;
  final String? mobileNo;
  final String? customerClassName;
  final String? membershipId;
  final dynamic customerClassId;
  final List<String>? customerGroupsIds;
  final dynamic customerStatusId;
  final List<CustomerAddress>? customerAddresses;
  final List<dynamic>? responsibles;
  final bool? isActive;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? listPriceId;
  final String? customerVatNo;
  final String? email;
  final String? customerNo;
  final String? customerNotes;
  final String? customerType;

  Datum({
    this.id,
    this.fullname,
    this.mobileNo,
    this.customerClassName,
    this.membershipId,
    this.customerClassId,
    this.customerGroupsIds,
    this.customerStatusId,
    this.customerAddresses,
    this.responsibles,
    this.isActive,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.listPriceId,
    this.customerVatNo,
    this.email,
    this.customerNo,
    this.customerNotes,
    this.customerType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        fullname: json["fullname"] == null
            ? []
            : List<Fullname>.from(
                json["fullname"]!.map((x) => Fullname.fromJson(x))),
        mobileNo: json["mobileNo"],
        customerClassName: json["customerClassName"],
        membershipId: json["membershipId"],
        customerClassId: json["customerClassId"],
        customerGroupsIds: json["customerGroupsIds"] == null
            ? []
            : List<String>.from(json["customerGroupsIds"]!.map((x) => x)),
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        listPriceId: json["listPriceId"],
        customerVatNo: json["customerVatNo"],
        email: json["email"],
        customerNo: json["customerNo"],
        customerNotes: json["customerNotes"],
        customerType: json["customerType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullname": fullname == null
            ? []
            : List<dynamic>.from(fullname!.map((x) => x.toJson())),
        "mobileNo": mobileNo,
        "customerClassName": customerClassName,
        "membershipId": membershipId,
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "listPriceId": listPriceId,
        "customerVatNo": customerVatNo,
        "email": email,
        "customerNo": customerNo,
        "customerNotes": customerNotes,
        "customerType": customerType,
      };
}

class CustomerAddress {
  final String? name;
  final String? city;
  final String? region;
  final String? street;
  final String? desc;
  final String? id;
  final String? buildingNumber;
  final String? apartmentNumber;
  final String? zipCode;

  CustomerAddress({
    this.name,
    this.city,
    this.region,
    this.street,
    this.desc,
    this.id,
    this.buildingNumber,
    this.apartmentNumber,
    this.zipCode,
  });

  factory CustomerAddress.fromJson(Map<String, dynamic> json) =>
      CustomerAddress(
        name: json["name"],
        city: json["city"],
        region: json["region"],
        street: json["street"],
        desc: json["desc"],
        id: json["_id"],
        buildingNumber: json["buildingNumber"],
        apartmentNumber: json["apartmentNumber"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
        "region": region,
        "street": street,
        "desc": desc,
        "_id": id,
        "buildingNumber": buildingNumber,
        "apartmentNumber": apartmentNumber,
        "zipCode": zipCode,
      };
}

class Fullname {
  final String? text;
  final Lang? lang;
  final String? id;

  Fullname({
    this.text,
    this.lang,
    this.id,
  });

  factory Fullname.fromJson(Map<String, dynamic> json) => Fullname(
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
