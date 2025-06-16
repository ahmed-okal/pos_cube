// To parse this JSON data, do
//
//     final ordersListModel = ordersListModelFromJson(jsonString);

import 'dart:convert';

OrdersListModel ordersListModelFromJson(String str) =>
    OrdersListModel.fromJson(json.decode(str));

String ordersListModelToJson(OrdersListModel data) =>
    json.encode(data.toJson());

class OrdersListModel {
  final int? status;
  final String? result;
  final List<Datum>? data;

  OrdersListModel({
    this.status,
    this.result,
    this.data,
  });

  factory OrdersListModel.fromJson(Map<String, dynamic> json) =>
      OrdersListModel(
        status: json["status"],
        result: json["result"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? orderNo;
  final dynamic orderRef;
  final DateTime? orderDate;
  final dynamic orderDateDue;
  final dynamic totalAmount;
  final dynamic discountAmount;
  final dynamic promoCodeId;
  final dynamic promoCode;
  final dynamic vatAmount;
  final dynamic netAmount;
  final dynamic typeId;
  final dynamic statusId;
  final bool? isPaid;
  final dynamic invTags;
  final dynamic customerId;
  final dynamic customerName;
  final dynamic salesmanId;
  final dynamic salesmanName;
  final dynamic notes;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isReturned;
  final int? countReturned;
  final dynamic terms;
  final List<Item>? items;

  Datum({
    this.id,
    this.orderNo,
    this.orderRef,
    this.orderDate,
    this.orderDateDue,
    this.totalAmount,
    this.discountAmount,
    this.promoCodeId,
    this.promoCode,
    this.vatAmount,
    this.netAmount,
    this.typeId,
    this.statusId,
    this.isPaid,
    this.invTags,
    this.customerId,
    this.customerName,
    this.salesmanId,
    this.salesmanName,
    this.notes,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.isReturned,
    this.countReturned,
    this.terms,
    this.items,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderNo: json["order_no"],
        orderRef: json["order_ref"],
        orderDate: json["order_date"] == null
            ? null
            : DateTime.parse(json["order_date"]),
        orderDateDue: json["order_date_due"],
        totalAmount: json["total_amount"],
        discountAmount: json["discount_amount"],
        promoCodeId: json["promo_code_id"],
        promoCode: json["promo_code"],
        vatAmount: json["vat_amount"],
        netAmount: json["net_amount"],
        typeId: json["type_id"],
        statusId: json["status_id"],
        isPaid: json["is_paid"],
        invTags: json["inv_tags"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        salesmanId: json["salesman_id"],
        salesmanName: json["salesman_name"],
        notes: json["notes"],
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
        isReturned: json["is_returned"],
        countReturned: json["count_returned"],
        terms: json["terms"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_no": orderNo,
        "order_ref": orderRef,
        "order_date": orderDate?.toIso8601String(),
        "order_date_due": orderDateDue,
        "total_amount": totalAmount,
        "discount_amount": discountAmount,
        "promo_code_id": promoCodeId,
        "promo_code": promoCode,
        "vat_amount": vatAmount,
        "net_amount": netAmount,
        "type_id": typeId,
        "status_id": statusId,
        "is_paid": isPaid,
        "inv_tags": invTags,
        "customer_id": customerId,
        "customer_name": customerName,
        "salesman_id": salesmanId,
        "salesman_name": salesmanName,
        "notes": notes,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_returned": isReturned,
        "count_returned": countReturned,
        "terms": terms,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  final int? id;
  final int? orderId;
  final String? orderNo;
  final String? productId;
  final String? productName;
  final int? unitId;
  final String? qty;
  final String? price;
  final String? totalPrice;
  final String? productDiscount;
  final String? productNetTotal;
  final String? productVat;
  final String? productNetTotalWithVat;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isReturned;
  final String? productDesc;
  final dynamic uom;
  final dynamic uomTemplateId;

  Item({
    this.id,
    this.orderId,
    this.orderNo,
    this.productId,
    this.productName,
    this.unitId,
    this.qty,
    this.price,
    this.totalPrice,
    this.productDiscount,
    this.productNetTotal,
    this.productVat,
    this.productNetTotalWithVat,
    this.createdAt,
    this.updatedAt,
    this.isReturned,
    this.productDesc,
    this.uom,
    this.uomTemplateId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        orderId: json["order_id"],
        orderNo: json["order_no"],
        productId: json["product_id"],
        productName: json["product_name"],
        unitId: json["unit_id"],
        qty: json["qty"],
        price: json["price"],
        totalPrice: json["total_price"],
        productDiscount: json["product_discount"],
        productNetTotal: json["product_net_total"],
        productVat: json["product_vat"],
        productNetTotalWithVat: json["product_net_total_with_vat"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isReturned: json["is_returned"],
        productDesc: json["product_desc"],
        uom: json["uom"],
        uomTemplateId: json["uom_template_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "order_no": orderNo,
        "product_id": productId,
        "product_name": productName,
        "unit_id": unitId,
        "qty": qty,
        "price": price,
        "total_price": totalPrice,
        "product_discount": productDiscount,
        "product_net_total": productNetTotal,
        "product_vat": productVat,
        "product_net_total_with_vat": productNetTotalWithVat,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_returned": isReturned,
        "product_desc": productDesc,
        "uom": uom,
        "uom_template_id": uomTemplateId,
      };
}
