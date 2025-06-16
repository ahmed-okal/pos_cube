import 'package:point_of_sale/core/services/use_case.dart';

class GenerateSessionIntity extends Param {
  String tenantId, companyId, branchId;
  GenerateSessionIntity(
      {required super.loading,
      required this.tenantId,
      required this.companyId,
      required this.branchId});
}
