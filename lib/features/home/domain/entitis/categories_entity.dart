import 'package:point_of_sale/core/services/use_case.dart';

class CategoriesEntity extends Param {
  String tenantId, companyId;
  CategoriesEntity(
      {required super.loading,
      required this.companyId,
      required this.tenantId});
}
