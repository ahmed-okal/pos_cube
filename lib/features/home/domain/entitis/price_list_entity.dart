import '../../../../core/services/use_case.dart';

class PriceListEntity extends Param {
  String tenantId, companyId, branchId;
  PriceListEntity({
    required super.loading,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
  });
  Map<String, dynamic> toJson() {
    return {
      "tenant_id": tenantId,
      "company_id": companyId,
      "branch_id": branchId,
    };
  }
}
