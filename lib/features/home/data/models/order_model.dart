// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  final int? status;
  final String? result;
  final Data? data;

  OrderModel({
    this.status,
    this.result,
    this.data,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
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
  final String? orderId;
  final String? orderNo;
  final String? productId;
  final String? productName;
  final String? productDesc;
  final String? unitId;
  final String? qty;
  final String? price;
  final String? totalPrice;
  final String? productDiscount;
  final String? productNetTotal;
  final String? productVat;
  final String? productNetTotalWithVat;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  Data({
    this.orderId,
    this.orderNo,
    this.productId,
    this.productName,
    this.productDesc,
    this.unitId,
    this.qty,
    this.price,
    this.totalPrice,
    this.productDiscount,
    this.productNetTotal,
    this.productVat,
    this.productNetTotalWithVat,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderId: json["order_id"],
        orderNo: json["order_no"],
        productId: json["product_id"],
        productName: json["product_name"],
        productDesc: json["product_desc"],
        unitId: json["unit_id"],
        qty: json["qty"],
        price: json["price"],
        totalPrice: json["total_price"],
        productDiscount: json["product_discount"],
        productNetTotal: json["product_net_total"],
        productVat: json["product_vat"],
        productNetTotalWithVat: json["product_net_total_with_vat"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_no": orderNo,
        "product_id": productId,
        "product_name": productName,
        "product_desc": productDesc,
        "unit_id": unitId,
        "qty": qty,
        "price": price,
        "total_price": totalPrice,
        "product_discount": productDiscount,
        "product_net_total": productNetTotal,
        "product_vat": productVat,
        "product_net_total_with_vat": productNetTotalWithVat,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
