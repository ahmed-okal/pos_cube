import 'package:point_of_sale/core/services/api_service.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entitis/delete_entity.dart';
import '../models/delete_item_model.dart';

abstract class DeleteItemRemoteDataSource {
  Future<DeleteItemResponse> deleteItem(DeleteEntity deleteEntity);
}

class DeleteItemRemoteDataSourceImpl extends DeleteItemRemoteDataSource {
  ApiService apiService;
  DeleteItemRemoteDataSourceImpl(this.apiService);
  @override
  Future<DeleteItemResponse> deleteItem(DeleteEntity deleteEntity) async {
    final result = await apiService.deleteRequest(
      '${Constants.baseUrl}sales/pos/orders/detail/${deleteEntity.itemId}',
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return DeleteItemResponse.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'getCreateNewOrder failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
