import 'package:point_of_sale/core/services/api_service.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entitis/orders_list_entity.dart';
import '../models/orders_list_model.dart';

abstract class OrdersListRemoteDataSource {
  Future<OrdersListModel> getOrders(OrdersListEntity ordersListEntity);
}

class OrdersListRemoteDataSourceImpl extends OrdersListRemoteDataSource {
  ApiService apiService;
  OrdersListRemoteDataSourceImpl(this.apiService);
  @override
  Future<OrdersListModel> getOrders(OrdersListEntity ordersListEntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}sales/pos/orders/open/${ordersListEntity.tenantId}/${ordersListEntity.companyId}/${ordersListEntity.branchId}/${ordersListEntity.userId}',
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return OrdersListModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'getCreateNewOrder failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
