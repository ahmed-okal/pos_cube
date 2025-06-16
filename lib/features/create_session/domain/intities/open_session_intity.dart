import 'package:point_of_sale/core/services/use_case.dart';

class OpenSessionIntity extends Param {
  String sessionCode,
      openCash,
      openNotes,
      tenantId,
      companyId,
      branchId,
      createdBy;
  OpenSessionIntity(
      {required super.loading,
      required this.branchId,
      required this.companyId,
      required this.createdBy,
      required this.openCash,
      required this.openNotes,
      required this.sessionCode,
      required this.tenantId});
  Map<String, dynamic> toJson() {
    return {
      "session_code": sessionCode,
      "open_cash": openCash,
      "open_notes": openNotes,
      "tenant_id": tenantId,
      "company_id": companyId,
      "branch_id": branchId,
      "created_by": createdBy
    };
  }
}
