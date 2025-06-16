import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/payment/data/models/payment_methods_model.dart';
import 'package:point_of_sale/features/payment/domain/intities/payment_methods_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class PaymentMethodsRemoteDataSource {
  Future<List<PaymentMethodsModel>> getPaymentMethods(
      PaymentMethodsEntity paymentMothodsEntity);
}

class PaymentMethodsRemoteDataSourceImpl
    implements PaymentMethodsRemoteDataSource {
  ApiService apiService;
  PaymentMethodsRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<PaymentMethodsModel>> getPaymentMethods(
      PaymentMethodsEntity paymentMothodsEntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}sales/payment-methods/${paymentMothodsEntity.tenantId}/${paymentMothodsEntity.companyId}/${paymentMothodsEntity.branchId}',
    );
    final responseData = result.data;
    if (result.statusCode == 200 || result.statusCode == 201) {
      if (result.data is List) {
        return (result.data as List)
            .map((json) => PaymentMethodsModel.fromJson(json))
            .toList();
      } else {
        return [PaymentMethodsModel.fromJson(result.data)];
      }
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'Failed to load payment methods',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
