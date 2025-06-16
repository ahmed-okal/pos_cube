import 'package:dio/dio.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/payment/data/models/pay_order_model.dart';
import 'package:point_of_sale/features/payment/domain/intities/pay_order_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class PayOrderRemoteDataSource {
  Future<PayOrderModel> payOrder(PayOrderEntity payOrderParam);
}

class PayOrderRemoteDataSourceImpl extends PayOrderRemoteDataSource {
  ApiService apiService;
  PayOrderRemoteDataSourceImpl(this.apiService);
  @override
  Future<PayOrderModel> payOrder(PayOrderEntity payOrderParam) async {
    final result = await apiService.postRaw(
      '${Constants.baseUrl}sales/payment-transactions-multi',
      payOrderParam.toJson(),
      Options(
        contentType: Headers.jsonContentType,
      ),
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return PayOrderModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'getCreateNewOrder failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
