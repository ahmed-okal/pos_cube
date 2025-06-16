import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/core/utils/constants.dart';
import 'package:point_of_sale/features/home/data/models/create_new_order_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/create_new_order_entity.dart';

abstract class CreateNewOrderRemoteDataSource {
  Future<CreateNewOrderModel> getCreateNewOrder(
      CreateNewOrderEntity createNewOrderIntity);
}

class CreateNewOrderRemoteDataSourceImpl
    implements CreateNewOrderRemoteDataSource {
  ApiService apiService;
  CreateNewOrderRemoteDataSourceImpl(this.apiService);
  @override
  Future<CreateNewOrderModel> getCreateNewOrder(
      CreateNewOrderEntity createNewOrderIntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}sales/pos/orders/${createNewOrderIntity.tenantId}/${createNewOrderIntity.companyId}/${createNewOrderIntity.branchId}/${createNewOrderIntity.userId}/${createNewOrderIntity.tableId}',
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return CreateNewOrderModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'getCreateNewOrder failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
