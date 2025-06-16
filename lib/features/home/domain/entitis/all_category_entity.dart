import '../../../../core/services/use_case.dart';

class AllCategoryEntity extends Param {
  String tenantId, companyId;
  AllCategoryEntity(
      {required super.loading,
      required this.companyId,
      required this.tenantId});
  Map<String, dynamic> toJson() {
    return {
      "tenantId": tenantId,
      "companyId": companyId,
    };
  }
}
