import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entitis/customers_group_entity.dart';
import '../models/customer_group_model.dart';

abstract class CustomersGroupRemoteDataSource {
  Future<CustomersGroupModel> getCustomersGroup(
      CustomersGroupEntity customersGroupEntity);
}

class CustomersGroupRemoteDataSourceImpl
    implements CustomersGroupRemoteDataSource {
  ApiService apiService;
  CustomersGroupRemoteDataSourceImpl(this.apiService);

  @override
  Future<CustomersGroupModel> getCustomersGroup(
      CustomersGroupEntity customersGroupEntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}auth/customers/groups/${customersGroupEntity.tenantId}/${customersGroupEntity.companyId}/${customersGroupEntity.branchId}',
    );
    final responseData = result.data;
    if (result.statusCode == 200 || result.statusCode == 201) {
      return CustomersGroupModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'Authentication failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
