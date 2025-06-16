import '../../../../core/services/use_case.dart';

class GetCashInOutEntity extends Param {
  String tenantId, companyId, branchId, sessionId;
  GetCashInOutEntity({
    required super.loading,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required this.sessionId,
  });
  Map<String, dynamic> toJson() {
    return {
      "session_id": sessionId,
      "tenant_id": tenantId,
      "company_id": companyId,
      "branch_id": branchId,
    };
  }
}
