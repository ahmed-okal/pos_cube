import 'package:dio/dio.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/data/models/add_customer_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/add_customer_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class AddCustomerRemoteDataSource {
  Future<AddCustomerModel> addCustomer(AddCustomerEntity addCustomerEntity);
}

class AddCustomerRemoteDataSourceImpl implements AddCustomerRemoteDataSource {
  ApiService apiService;
  AddCustomerRemoteDataSourceImpl(this.apiService);

  @override
  Future<AddCustomerModel> addCustomer(
      AddCustomerEntity addCustomerEntity) async {
    final result = await apiService.postRaw(
      '${Constants.baseUrl}auth/customers',
      addCustomerEntity.toJson(),
      Options(
        contentType: Headers.jsonContentType,
      ),
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return AddCustomerModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
