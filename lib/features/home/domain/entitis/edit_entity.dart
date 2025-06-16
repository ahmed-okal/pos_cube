import '../../../../../core/services/use_case.dart';

class EditEntity extends Param {
  String productId, productName, qty, price, totalPrice;
  int itemId;

  EditEntity(
      {required super.loading,
      required this.productId,
      required this.productName,
      required this.qty,
      required this.price,
      required this.totalPrice,
      required this.itemId});
  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'qty': qty,
      'price': price,
      'total_price': totalPrice,
    };
  }
}
