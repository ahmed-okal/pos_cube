import '../../../../core/services/use_case.dart';

class CustomersGroupEntity extends Param {
  String tenantId, companyId, branchId;
  CustomersGroupEntity({
    required super.loading,
    required this.companyId,
    required this.tenantId,
    required this.branchId,
  });
  Map<String, dynamic> toJson() {
    return {
      "tenantId": tenantId,
      "companyId": companyId,
      "branchId": branchId,
    };
  }
}
