import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/data/models/order_details_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entitis/order_details_intity.dart';

abstract class OrderDetailsRemoteDataSource {
  Future<OrderDetailsModel> getOrderDetails(
      OrderDetailsIntity orderDetailsIntity);
}

class OrderDetailsRemoteDataSourceImpl implements OrderDetailsRemoteDataSource {
  ApiService apiService;
  OrderDetailsRemoteDataSourceImpl(this.apiService);
  @override
  Future<OrderDetailsModel> getOrderDetails(
      OrderDetailsIntity orderDetailsIntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}sales/pos/orders/${orderDetailsIntity.orderId}',
    );
    final responseData = result.data;
    if (result.statusCode == 200 || result.statusCode == 201) {
      return OrderDetailsModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'Authentication failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
