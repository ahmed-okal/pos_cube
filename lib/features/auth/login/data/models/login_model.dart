// To parse this JSON data, do
//
//     final loginTaskModel = loginTaskModelFromJson(jsonString);

import 'dart:convert';

LoginTaskModel loginTaskModelFromJson(String str) =>
    LoginTaskModel.fromJson(json.decode(str));

String loginTaskModelToJson(LoginTaskModel data) => json.encode(data.toJson());

class LoginTaskModel {
  final int? status;
  final String? message;
  final Data? data;

  LoginTaskModel({
    this.status,
    this.message,
    this.data,
  });

  factory LoginTaskModel.fromJson(Map<String, dynamic> json) => LoginTaskModel(
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
  final String? token;
  final User? user;
  final List<Company>? company;

  Data({
    this.token,
    this.user,
    this.company,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        company: json["company"] == null
            ? []
            : List<Company>.from(
                json["company"]!.map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
        "company": company == null
            ? []
            : List<dynamic>.from(company!.map((x) => x.toJson())),
      };
}

class Company {
  final Settings? settings;
  final List<Desc>? name;
  final bool? isActive;
  final int? branchCount;
  final int? empCount;
  final String? mainCurrency;
  final bool? hasVat;
  final String? country;
  final List<Branch>? branches;
  final String? id;
  final List<Desc>? desc;
  final List<Desc>? mainAddress;
  final String? vatNumber;
  final String? commercialRegisteration;
  final String? logo;
  final String? mainEmail;
  final String? mainPhone;
  final String? websiteUrl;

  Company({
    this.settings,
    this.name,
    this.isActive,
    this.branchCount,
    this.empCount,
    this.mainCurrency,
    this.hasVat,
    this.country,
    this.branches,
    this.id,
    this.desc,
    this.mainAddress,
    this.vatNumber,
    this.commercialRegisteration,
    this.logo,
    this.mainEmail,
    this.mainPhone,
    this.websiteUrl,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        settings: json["settings"] == null
            ? null
            : Settings.fromJson(json["settings"]),
        name: json["name"] == null
            ? []
            : List<Desc>.from(json["name"]!.map((x) => Desc.fromJson(x))),
        isActive: json["isActive"],
        branchCount: json["branchCount"],
        empCount: json["empCount"],
        mainCurrency: json["mainCurrency"],
        hasVat: json["hasVat"],
        country: json["country"],
        branches: json["branches"] == null
            ? []
            : List<Branch>.from(
                json["branches"]!.map((x) => Branch.fromJson(x))),
        id: json["_id"],
        desc: json["desc"] == null
            ? []
            : List<Desc>.from(json["desc"]!.map((x) => Desc.fromJson(x))),
        mainAddress: json["mainAddress"] == null
            ? []
            : List<Desc>.from(
                json["mainAddress"]!.map((x) => Desc.fromJson(x))),
        vatNumber: json["vatNumber"],
        commercialRegisteration: json["commercialRegisteration"],
        logo: json["logo"],
        mainEmail: json["mainEmail"],
        mainPhone: json["mainPhone"],
        websiteUrl: json["websiteUrl"],
      );

  Map<String, dynamic> toJson() => {
        "settings": settings?.toJson(),
        "name": name == null
            ? []
            : List<dynamic>.from(name!.map((x) => x.toJson())),
        "isActive": isActive,
        "branchCount": branchCount,
        "empCount": empCount,
        "mainCurrency": mainCurrency,
        "hasVat": hasVat,
        "country": country,
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
        "_id": id,
        "desc": desc == null
            ? []
            : List<dynamic>.from(desc!.map((x) => x.toJson())),
        "mainAddress": mainAddress == null
            ? []
            : List<dynamic>.from(mainAddress!.map((x) => x.toJson())),
        "vatNumber": vatNumber,
        "commercialRegisteration": commercialRegisteration,
        "logo": logo,
        "mainEmail": mainEmail,
        "mainPhone": mainPhone,
        "websiteUrl": websiteUrl,
      };
}

class Branch {
  final List<Desc>? name;
  final String? id;
  final List<Desc>? desc;
  final String? branchCode;

  Branch({
    this.name,
    this.id,
    this.desc,
    this.branchCode,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        name: json["name"] == null
            ? []
            : List<Desc>.from(json["name"]!.map((x) => Desc.fromJson(x))),
        id: json["_id"],
        desc: json["desc"] == null
            ? []
            : List<Desc>.from(json["desc"]!.map((x) => Desc.fromJson(x))),
        branchCode: json["branchCode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null
            ? []
            : List<dynamic>.from(name!.map((x) => x.toJson())),
        "_id": id,
        "desc": desc == null
            ? []
            : List<dynamic>.from(desc!.map((x) => x.toJson())),
        "branchCode": branchCode,
      };
}

class Desc {
  final String? text;
  final String? lang;
  final String? id;

  Desc({
    this.text,
    this.lang,
    this.id,
  });

  factory Desc.fromJson(Map<String, dynamic> json) => Desc(
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

class Settings {
  final List<GeneralSetting>? generalSettings;
  final List<GeneralSetting>? invoice;
  final List<GeneralSetting>? quote;
  final List<GeneralSetting>? purchase;

  Settings({
    this.generalSettings,
    this.invoice,
    this.quote,
    this.purchase,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        generalSettings: json["generalSettings"] == null
            ? []
            : List<GeneralSetting>.from(json["generalSettings"]!
                .map((x) => GeneralSetting.fromJson(x))),
        invoice: json["invoice"] == null
            ? []
            : List<GeneralSetting>.from(
                json["invoice"]!.map((x) => GeneralSetting.fromJson(x))),
        quote: json["quote"] == null
            ? []
            : List<GeneralSetting>.from(
                json["quote"]!.map((x) => GeneralSetting.fromJson(x))),
        purchase: json["purchase"] == null
            ? []
            : List<GeneralSetting>.from(
                json["purchase"]!.map((x) => GeneralSetting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "generalSettings": generalSettings == null
            ? []
            : List<dynamic>.from(generalSettings!.map((x) => x.toJson())),
        "invoice": invoice == null
            ? []
            : List<dynamic>.from(invoice!.map((x) => x.toJson())),
        "quote": quote == null
            ? []
            : List<dynamic>.from(quote!.map((x) => x.toJson())),
        "purchase": purchase == null
            ? []
            : List<dynamic>.from(purchase!.map((x) => x.toJson())),
      };
}

class GeneralSetting {
  final String? name;
  final String? value;
  final String? id;

  GeneralSetting({
    this.name,
    this.value,
    this.id,
  });

  factory GeneralSetting.fromJson(Map<String, dynamic> json) => GeneralSetting(
        name: json["name"],
        value: json["value"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "_id": id,
      };
}

class User {
  final String? id;
  final String? email;
  final String? username;
  final String? mobile;
  final String? name;
  final String? jobTitle;
  final int? pinCodeLock;
  final bool? isEmployee;
  final dynamic userClassId;
  final String? defaultAppId;
  final dynamic myApps;
  final dynamic userSettings;
  final String? tenantId;
  final String? companyId;
  final String? branchId;

  User({
    this.id,
    this.email,
    this.username,
    this.mobile,
    this.name,
    this.jobTitle,
    this.pinCodeLock,
    this.isEmployee,
    this.userClassId,
    this.defaultAppId,
    this.myApps,
    this.userSettings,
    this.tenantId,
    this.companyId,
    this.branchId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        username: json["username"],
        mobile: json["mobile"],
        name: json["name"],
        jobTitle: json["jobTitle"],
        pinCodeLock: json["pinCodeLock"],
        isEmployee: json["isEmployee"],
        userClassId: json["user_class_id"],
        defaultAppId: json["default_app_id"],
        myApps: json["my_apps"],
        userSettings: json["userSettings"],
        tenantId: json["tenant_id"],
        companyId: json["company_id"],
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "username": username,
        "mobile": mobile,
        "name": name,
        "jobTitle": jobTitle,
        "pinCodeLock": pinCodeLock,
        "isEmployee": isEmployee,
        "user_class_id": userClassId,
        "default_app_id": defaultAppId,
        "my_apps": myApps,
        "userSettings": userSettings,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
      };
}
