import '../../../../core/services/use_case.dart';

class PayOrderEntity extends Param {
  final String amount;
  final String paymentMethodId;
  final String notes,
      orderId,
      orderNumber,
      tenantId,
      companyId,
      branchId,
      userId;

  PayOrderEntity({
    required this.orderId,
    required this.orderNumber,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required this.userId,
    required this.amount,
    required this.paymentMethodId,
    required this.notes,
    required super.loading,
  });

  Map<String, dynamic> toJson() {
    return {
      "items": [
        {"amount": amount, "payment_method_id": paymentMethodId, "notes": notes}
      ],
      "inv_id": orderId,
      "inv_no": orderNumber,
      "tenant_id": tenantId,
      "company_id": companyId,
      "branch_id": branchId,
      "created_by": userId
    };
  }
}
