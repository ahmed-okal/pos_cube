import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/core/utils/constants.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entitis/customers_entity.dart';
import '../models/customers_model.dart';

abstract class CustomersRemoteDataSource {
  Future<CustomersModel> getCustomers(CustomersEntity customersEntity);
}

class CustomersRemoteDataSourceImpl implements CustomersRemoteDataSource {
  ApiService apiService;
  CustomersRemoteDataSourceImpl(this.apiService);

  @override
  Future<CustomersModel> getCustomers(CustomersEntity customersEntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}auth/customers/${customersEntity.tenantId}/${customersEntity.companyId}/${customersEntity.branchId}',
    );
    final responseData = result.data;
    if (result.statusCode == 200 || result.statusCode == 201) {
      return CustomersModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'Authentication failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
