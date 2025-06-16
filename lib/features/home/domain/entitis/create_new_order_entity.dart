import '../../../../core/services/use_case.dart';

class CreateNewOrderEntity extends Param {
  String tenantId, companyId, branchId, userId, tableId;
  CreateNewOrderEntity({
    required super.loading,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required this.userId,
    required this.tableId,
  });
}
