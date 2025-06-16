// To parse this JSON data, do
//
//     final catigoriesTaskModel = catigoriesTaskModelFromJson(jsonString);

import 'dart:convert';

CatigoriesTaskModel catigoriesTaskModelFromJson(String str) =>
    CatigoriesTaskModel.fromJson(json.decode(str));

String catigoriesTaskModelToJson(CatigoriesTaskModel data) =>
    json.encode(data.toJson());

class CatigoriesTaskModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  CatigoriesTaskModel({
    this.status,
    this.message,
    this.data,
  });

  factory CatigoriesTaskModel.fromJson(Map<String, dynamic> json) =>
      CatigoriesTaskModel(
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
  final List<CategoryDesc>? categoryName;
  final dynamic categoryParent;
  final List<CategoryDesc>? categoryDesc;
  final bool? isActive;
  final bool? isShowOnWebsite;
  final List<Product>? products;

  Datum({
    this.id,
    this.categoryName,
    this.categoryParent,
    this.categoryDesc,
    this.isActive,
    this.isShowOnWebsite,
    this.products,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        categoryName: json["categoryName"] == null
            ? []
            : List<CategoryDesc>.from(
                json["categoryName"]!.map((x) => CategoryDesc.fromJson(x))),
        categoryParent: json["categoryParent"],
        categoryDesc: json["categoryDesc"] == null
            ? []
            : List<CategoryDesc>.from(
                json["categoryDesc"]!.map((x) => CategoryDesc.fromJson(x))),
        isActive: json["isActive"],
        isShowOnWebsite: json["isShowOnWebsite"],
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "categoryName": categoryName == null
            ? []
            : List<dynamic>.from(categoryName!.map((x) => x.toJson())),
        "categoryParent": categoryParent,
        "categoryDesc": categoryDesc == null
            ? []
            : List<dynamic>.from(categoryDesc!.map((x) => x.toJson())),
        "isActive": isActive,
        "isShowOnWebsite": isShowOnWebsite,
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class CategoryDesc {
  final String? text;
  final Lang? lang;
  final String? id;

  CategoryDesc({
    this.text,
    this.lang,
    this.id,
  });

  factory CategoryDesc.fromJson(Map<String, dynamic> json) => CategoryDesc(
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

class Product {
  final String? id;
  final String? productCode;
  final String? productBarcode;
  final String? productFactoryCode;
  final List<CategoryDesc>? productName;
  final List<CategoryDesc>? productDesc;
  final List<CategoryDesc>? productMetaKeywords;
  final List<CategoryDesc>? productMetaDesc;
  final List<String>? productTags;
  final String? productHomePic;
  final List<String>? productImages;
  final String? productType;
  final dynamic productClass;
  final List<String>? productCategory;
  final String? productBrand;
  final List<dynamic>? productWarhouse;
  final int? price;
  final int? qty;
  final bool? isStock;
  final bool? isShowOnWebsite;
  final bool? isActive;
  final String? tenantId;
  final String? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? codeInStock;
  final int? cost;
  final Uom? uomPurchase;
  final Uom? uomSale;
  final UomTemplate? uomTemplate;

  Product({
    this.id,
    this.productCode,
    this.productBarcode,
    this.productFactoryCode,
    this.productName,
    this.productDesc,
    this.productMetaKeywords,
    this.productMetaDesc,
    this.productTags,
    this.productHomePic,
    this.productImages,
    this.productType,
    this.productClass,
    this.productCategory,
    this.productBrand,
    this.productWarhouse,
    this.price,
    this.qty,
    this.isStock,
    this.isShowOnWebsite,
    this.isActive,
    this.tenantId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.codeInStock,
    this.cost,
    this.uomPurchase,
    this.uomSale,
    this.uomTemplate,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productCode: json["productCode"],
        productBarcode: json["productBarcode"],
        productFactoryCode: json["productFactoryCode"],
        productName: json["productName"] == null
            ? []
            : List<CategoryDesc>.from(
                json["productName"]!.map((x) => CategoryDesc.fromJson(x))),
        productDesc: json["productDesc"] == null
            ? []
            : List<CategoryDesc>.from(
                json["productDesc"]!.map((x) => CategoryDesc.fromJson(x))),
        productMetaKeywords: json["productMetaKeywords"] == null
            ? []
            : List<CategoryDesc>.from(json["productMetaKeywords"]!
                .map((x) => CategoryDesc.fromJson(x))),
        productMetaDesc: json["productMetaDesc"] == null
            ? []
            : List<CategoryDesc>.from(
                json["productMetaDesc"]!.map((x) => CategoryDesc.fromJson(x))),
        productTags: json["productTags"] == null
            ? []
            : List<String>.from(json["productTags"]!.map((x) => x)),
        productHomePic: json["productHomePic"],
        productImages: json["productImages"] == null
            ? []
            : List<String>.from(json["productImages"]!.map((x) => x)),
        productType: json["productType"],
        productClass: json["productClass"],
        productCategory: json["productCategory"] == null
            ? []
            : List<String>.from(json["productCategory"]!.map((x) => x)),
        productBrand: json["productBrand"],
        productWarhouse: json["productWarhouse"] == null
            ? []
            : List<dynamic>.from(json["productWarhouse"]!.map((x) => x)),
        price: json["price"],
        qty: json["qty"],
        isStock: json["isStock"],
        isShowOnWebsite: json["isShowOnWebsite"],
        isActive: json["isActive"],
        tenantId: json["tenantId"],
        companyId: json["companyId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        codeInStock: json["codeInStock"],
        cost: json["cost"],
        uomPurchase: json["uomPurchase"] == null
            ? null
            : Uom.fromJson(json["uomPurchase"]),
        uomSale: json["uomSale"] == null ? null : Uom.fromJson(json["uomSale"]),
        uomTemplate: json["uomTemplate"] == null
            ? null
            : UomTemplate.fromJson(json["uomTemplate"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productCode": productCode,
        "productBarcode": productBarcode,
        "productFactoryCode": productFactoryCode,
        "productName": productName == null
            ? []
            : List<dynamic>.from(productName!.map((x) => x.toJson())),
        "productDesc": productDesc == null
            ? []
            : List<dynamic>.from(productDesc!.map((x) => x.toJson())),
        "productMetaKeywords": productMetaKeywords == null
            ? []
            : List<dynamic>.from(productMetaKeywords!.map((x) => x.toJson())),
        "productMetaDesc": productMetaDesc == null
            ? []
            : List<dynamic>.from(productMetaDesc!.map((x) => x.toJson())),
        "productTags": productTags == null
            ? []
            : List<dynamic>.from(productTags!.map((x) => x)),
        "productHomePic": productHomePic,
        "productImages": productImages == null
            ? []
            : List<dynamic>.from(productImages!.map((x) => x)),
        "productType": productType,
        "productClass": productClass,
        "productCategory": productCategory == null
            ? []
            : List<dynamic>.from(productCategory!.map((x) => x)),
        "productBrand": productBrand,
        "productWarhouse": productWarhouse == null
            ? []
            : List<dynamic>.from(productWarhouse!.map((x) => x)),
        "price": price,
        "qty": qty,
        "isStock": isStock,
        "isShowOnWebsite": isShowOnWebsite,
        "isActive": isActive,
        "tenantId": tenantId,
        "companyId": companyId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "codeInStock": codeInStock,
        "cost": cost,
        "uomPurchase": uomPurchase?.toJson(),
        "uomSale": uomSale?.toJson(),
        "uomTemplate": uomTemplate?.toJson(),
      };
}

class Uom {
  final int? id;
  final String? name;
  final String? shortName;
  final String? rate;

  Uom({
    this.id,
    this.name,
    this.shortName,
    this.rate,
  });

  factory Uom.fromJson(Map<String, dynamic> json) => Uom(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
        rate: json["rate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
        "rate": rate,
      };
}

class UomTemplate {
  final int? id;
  final String? name;

  UomTemplate({
    this.id,
    this.name,
  });

  factory UomTemplate.fromJson(Map<String, dynamic> json) => UomTemplate(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
