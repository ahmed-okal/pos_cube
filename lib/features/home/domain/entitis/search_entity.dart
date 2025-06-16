import 'package:point_of_sale/core/services/use_case.dart';

class SearchEntity extends Param {
  String name, tenantId, companyId;
  SearchEntity(
      {required super.loading,
      required this.name,
      required this.tenantId,
      required this.companyId});
  Map<String, dynamic> toJson() {
    return {
      'tenantId': tenantId,
      'companyId': companyId,
    };
  }
}
