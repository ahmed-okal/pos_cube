import '../../../../core/services/use_case.dart';

class KitchenNoteEntity extends Param {
  String tenantId,
      companyId,
      branchId,
      userId,
      orderId,
      orderNo,
      kitchenType,
      kitchenNote;
  KitchenNoteEntity({
    required super.loading,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required this.userId,
    required this.orderId,
    required this.orderNo,
    required this.kitchenType,
    required this.kitchenNote,
  });
  Map<String, dynamic> toJson() {
    return {
      "order_id": orderId,
      "order_no": orderNo,
      "kitchen_type": kitchenType,
      "kitchen_notes": kitchenNote,
      "tenant_id": tenantId,
      "company_id": companyId,
      "branch_id": branchId,
      "created_by": userId,
    };
  }
}
