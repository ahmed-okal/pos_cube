// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  final int? status;
  final String? result;
  final Data? data;

  OrderDetailsModel({
    this.status,
    this.result,
    this.data,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        status: json["status"],
        result: json["result"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final String? orderNo;
  final dynamic orderRef;
  final DateTime? orderDate;
  final dynamic orderDateDue;
  final String? totalAmount;
  final dynamic discountAmount;
  final dynamic promoCodeId;
  final dynamic promoCode;
  final String? vatAmount;
  final String? netAmount;
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
  final dynamic posSessionsId;
  final List<Item>? items;
  final List<PaymentTransaction>? paymentTransactions;

  Data({
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
    this.posSessionsId,
    this.items,
    this.paymentTransactions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        posSessionsId: json["pos_sessions_id"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        paymentTransactions: json["payment_transactions"] == null
            ? []
            : List<PaymentTransaction>.from(json["payment_transactions"]!
                .map((x) => PaymentTransaction.fromJson(x))),
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
        "pos_sessions_id": posSessionsId,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "payment_transactions": paymentTransactions == null
            ? []
            : List<dynamic>.from(paymentTransactions!.map((x) => x.toJson())),
      };
}

class Item {
  final int? id;
  final int? orderId;
  final String? orderNo;
  final String? productId;
  final String? productName;
  final dynamic unitId;
  final String? qty;
  final String? price;
  final String? totalPrice;
  final dynamic productDiscount;
  final dynamic productNetTotal;
  final dynamic productVat;
  final dynamic productNetTotalWithVat;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isReturned;
  final dynamic productDesc;
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

class PaymentTransaction {
  final int? id;
  final int? invId;
  final String? invNo;
  final dynamic transactionNo;
  final String? amount;
  final int? paymentMethodId;
  final dynamic notes;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? type;
  final PaymentMethod? paymentMethod;

  PaymentTransaction({
    this.id,
    this.invId,
    this.invNo,
    this.transactionNo,
    this.amount,
    this.paymentMethodId,
    this.notes,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.type,
    this.paymentMethod,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) =>
      PaymentTransaction(
        id: json["id"],
        invId: json["inv_id"],
        invNo: json["inv_no"],
        transactionNo: json["transaction_no"],
        amount: json["amount"],
        paymentMethodId: json["payment_method_id"],
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
        type: json["type"],
        paymentMethod: json["payment_method"] == null
            ? null
            : PaymentMethod.fromJson(json["payment_method"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "inv_id": invId,
        "inv_no": invNo,
        "transaction_no": transactionNo,
        "amount": amount,
        "payment_method_id": paymentMethodId,
        "notes": notes,
        "tenant_id": tenantId,
        "company_id": companyId,
        "branch_id": branchId,
        "created_by": createdBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "type": type,
        "payment_method": paymentMethod?.toJson(),
      };
}

class PaymentMethod {
  final int? id;
  final bool? isActive;
  final String? tenantId;
  final String? companyId;
  final String? branchId;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Description>? description;

  PaymentMethod({
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

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
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
