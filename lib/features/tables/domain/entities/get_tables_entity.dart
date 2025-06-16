import '../../../../core/services/use_case.dart';

class GetTablesEntity extends Param {
  String tenantId, companyId, branchId;
  GetTablesEntity({
    required super.loading,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
  });
}
