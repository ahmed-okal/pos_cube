import '../../../../core/services/use_case.dart';

class CashInOutEntity extends Param {
  String tenantId,
      companyId,
      branchId,
      userId,
      sessionId,
      cashType,
      cashAmount,
      cashReason;
  CashInOutEntity({
    required super.loading,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required this.userId,
    required this.cashType,
    required this.cashAmount,
    required this.cashReason,
    required this.sessionId,
  });
  Map<String, dynamic> toJson() {
    return {
      "session_id": sessionId,
      "cash_type": cashType,
      "cash_amount": cashAmount,
      "cash_reasons": cashReason,
      "tenant_id": tenantId,
      "company_id": companyId,
      "branch_id": branchId,
      "created_by": userId,
    };
  }
}
