import '../../../../core/services/use_case.dart';

class PaymentMethodsEntity extends Param {
  String tenantId, companyId, branchId;
  PaymentMethodsEntity({
    required super.loading,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
  });
}
