import '../../../../../core/services/use_case.dart';

class OrderParam extends Param {
  String orderId,
      orderNo,
      productId,
      productName,
      // productDesc,
      // unitId,
      qty,
      // productDiscount,
      // productNetTotal,
      // productVat,
      // productNetTotalWithVat,
      price,
      totalPrice;

  OrderParam({
    required super.loading,
    required this.orderId,
    required this.orderNo,
    required this.productId,
    required this.productName,
    // required this.productDesc,
    // required this.unitId,
    required this.qty,
    required this.price,
    required this.totalPrice,
    // required this.productDiscount,
    // required this.productNetTotal,
    // required this.productVat,
    // required this.productNetTotalWithVat,
  });
  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'order_no': orderNo,
      'product_id': productId,
      'product_name': productName,
      // 'product_desc': productDesc,
      // 'unit_id': unitId,
      'qty': qty,
      'price': price,
      'total_price': totalPrice,
      // 'product_discount': productDiscount,
      // 'product_net_total': productNetTotal,
      // 'product_vat': productVat,
      // 'product_net_total_with_vat': productNetTotalWithVat,
    };
  }
}
