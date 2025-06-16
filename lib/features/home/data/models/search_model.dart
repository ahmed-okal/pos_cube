// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  final int? status;
  final String? message;
  final List<Datum>? data;
  final Paginate? paginate;

  SearchModel({
    this.status,
    this.message,
    this.data,
    this.paginate,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        paginate: json["paginate"] == null
            ? null
            : Paginate.fromJson(json["paginate"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "paginate": paginate?.toJson(),
      };
}

class Datum {
  final String? id;
  final String? productCode;
  final String? productBarcode;
  final String? productFactoryCode;
  final List<ProductDesc>? productName;
  final List<ProductDesc>? productDesc;
  final List<ProductDesc>? productMetaKeywords;
  final List<ProductDesc>? productMetaDesc;
  final List<String>? productTags;
  final dynamic productHomePic;
  final List<String>? productImages;
  final String? productType;
  final dynamic productClass;
  final List<ProductCategory>? productCategory;
  final ProductBrand? productBrand;
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        productCode: json["productCode"],
        productBarcode: json["productBarcode"],
        productFactoryCode: json["productFactoryCode"],
        productName: json["productName"] == null
            ? []
            : List<ProductDesc>.from(
                json["productName"]!.map((x) => ProductDesc.fromJson(x))),
        productDesc: json["productDesc"] == null
            ? []
            : List<ProductDesc>.from(
                json["productDesc"]!.map((x) => ProductDesc.fromJson(x))),
        productMetaKeywords: json["productMetaKeywords"] == null
            ? []
            : List<ProductDesc>.from(json["productMetaKeywords"]!
                .map((x) => ProductDesc.fromJson(x))),
        productMetaDesc: json["productMetaDesc"] == null
            ? []
            : List<ProductDesc>.from(
                json["productMetaDesc"]!.map((x) => ProductDesc.fromJson(x))),
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
            : List<ProductCategory>.from(json["productCategory"]!
                .map((x) => ProductCategory.fromJson(x))),
        productBrand: json["productBrand"] == null
            ? null
            : ProductBrand.fromJson(json["productBrand"]),
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
            : List<dynamic>.from(productCategory!.map((x) => x.toJson())),
        "productBrand": productBrand?.toJson(),
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

class ProductBrand {
  final String? id;
  final List<ProductDesc>? brandName;
  final List<ProductDesc>? brandDesc;
  final List<ProductDesc>? brandMetaKeywords;
  final bool? isActive;
  final bool? isShowOnWebsite;
  final String? tenantId;
  final String? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  ProductBrand({
    this.id,
    this.brandName,
    this.brandDesc,
    this.brandMetaKeywords,
    this.isActive,
    this.isShowOnWebsite,
    this.tenantId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProductBrand.fromJson(Map<String, dynamic> json) => ProductBrand(
        id: json["_id"],
        brandName: json["brandName"] == null
            ? []
            : List<ProductDesc>.from(
                json["brandName"]!.map((x) => ProductDesc.fromJson(x))),
        brandDesc: json["brandDesc"] == null
            ? []
            : List<ProductDesc>.from(
                json["brandDesc"]!.map((x) => ProductDesc.fromJson(x))),
        brandMetaKeywords: json["brandMetaKeywords"] == null
            ? []
            : List<ProductDesc>.from(
                json["brandMetaKeywords"]!.map((x) => ProductDesc.fromJson(x))),
        isActive: json["isActive"],
        isShowOnWebsite: json["isShowOnWebsite"],
        tenantId: json["tenantId"],
        companyId: json["companyId"],
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
        "brandName": brandName == null
            ? []
            : List<dynamic>.from(brandName!.map((x) => x.toJson())),
        "brandDesc": brandDesc == null
            ? []
            : List<dynamic>.from(brandDesc!.map((x) => x.toJson())),
        "brandMetaKeywords": brandMetaKeywords == null
            ? []
            : List<dynamic>.from(brandMetaKeywords!.map((x) => x.toJson())),
        "isActive": isActive,
        "isShowOnWebsite": isShowOnWebsite,
        "tenantId": tenantId,
        "companyId": companyId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class ProductDesc {
  final String? text;
  final Lang? lang;
  final String? id;

  ProductDesc({
    this.text,
    this.lang,
    this.id,
  });

  factory ProductDesc.fromJson(Map<String, dynamic> json) => ProductDesc(
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

class ProductCategory {
  final String? id;
  final dynamic categoryParent;
  final String? categoryClass;
  final List<ProductDesc>? categoryName;
  final List<ProductDesc>? categoryDesc;
  final List<ProductDesc>? categoryMetaKeywords;
  final List<ProductDesc>? categoryMetaDesc;
  final bool? isActive;
  final bool? isShowOnWebsite;
  final String? tenantId;
  final String? companyId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? categoryCode;

  ProductCategory({
    this.id,
    this.categoryParent,
    this.categoryClass,
    this.categoryName,
    this.categoryDesc,
    this.categoryMetaKeywords,
    this.categoryMetaDesc,
    this.isActive,
    this.isShowOnWebsite,
    this.tenantId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.categoryCode,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["_id"],
        categoryParent: json["categoryParent"],
        categoryClass: json["categoryClass"],
        categoryName: json["categoryName"] == null
            ? []
            : List<ProductDesc>.from(
                json["categoryName"]!.map((x) => ProductDesc.fromJson(x))),
        categoryDesc: json["categoryDesc"] == null
            ? []
            : List<ProductDesc>.from(
                json["categoryDesc"]!.map((x) => ProductDesc.fromJson(x))),
        categoryMetaKeywords: json["categoryMetaKeywords"] == null
            ? []
            : List<ProductDesc>.from(json["categoryMetaKeywords"]!
                .map((x) => ProductDesc.fromJson(x))),
        categoryMetaDesc: json["categoryMetaDesc"] == null
            ? []
            : List<ProductDesc>.from(
                json["categoryMetaDesc"]!.map((x) => ProductDesc.fromJson(x))),
        isActive: json["isActive"],
        isShowOnWebsite: json["isShowOnWebsite"],
        tenantId: json["tenantId"],
        companyId: json["companyId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        categoryCode: json["categoryCode"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "categoryParent": categoryParent,
        "categoryClass": categoryClass,
        "categoryName": categoryName == null
            ? []
            : List<dynamic>.from(categoryName!.map((x) => x.toJson())),
        "categoryDesc": categoryDesc == null
            ? []
            : List<dynamic>.from(categoryDesc!.map((x) => x.toJson())),
        "categoryMetaKeywords": categoryMetaKeywords == null
            ? []
            : List<dynamic>.from(categoryMetaKeywords!.map((x) => x.toJson())),
        "categoryMetaDesc": categoryMetaDesc == null
            ? []
            : List<dynamic>.from(categoryMetaDesc!.map((x) => x.toJson())),
        "isActive": isActive,
        "isShowOnWebsite": isShowOnWebsite,
        "tenantId": tenantId,
        "companyId": companyId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "categoryCode": categoryCode,
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

class Paginate {
  final int? resultCount;
  final int? pageNumber;
  final int? pageSize;

  Paginate({
    this.resultCount,
    this.pageNumber,
    this.pageSize,
  });

  factory Paginate.fromJson(Map<String, dynamic> json) => Paginate(
        resultCount: json["resultCount"],
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
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
