import '../../../../core/services/use_case.dart';

class OrdersListEntity extends Param {
  String tenantId, companyId, branchId, userId;
  OrdersListEntity({
    required super.loading,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required this.userId,
  });
}
