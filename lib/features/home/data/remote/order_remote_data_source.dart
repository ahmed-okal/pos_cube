import 'package:dio/dio.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/domain/entitis/order_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<OrderModel> getOrders(OrderParam orderParam);
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  ApiService apiService;
  OrderRemoteDataSourceImpl(this.apiService);
  @override
  Future<OrderModel> getOrders(OrderParam orderParam) async {
    final result = await apiService.postRaw(
      '${Constants.baseUrl}sales/pos/orders/detail',
      orderParam.toJson(),
      Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return OrderModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'getCreateNewOrder failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
