import 'package:dio/dio.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/domain/entitis/edit_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../models/delete_item_model.dart';

abstract class EditItemRemoteDataSource {
  Future<DeleteItemResponse> editItem(EditEntity editEntity);
}

class EditItemRemoteDataSourceImpl extends EditItemRemoteDataSource {
  ApiService apiService;
  EditItemRemoteDataSourceImpl(this.apiService);
  @override
  Future<DeleteItemResponse> editItem(EditEntity editEntity) async {
    final result = await apiService.putRequest(
      '${Constants.baseUrl}sales/pos/orders/detail/${editEntity.itemId}',
      editEntity.toJson(),
      Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
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
