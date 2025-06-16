import 'package:point_of_sale/core/services/use_case.dart';

class DeleteEntity extends Param {
  int itemId;
  DeleteEntity({required super.loading, required this.itemId});
}
