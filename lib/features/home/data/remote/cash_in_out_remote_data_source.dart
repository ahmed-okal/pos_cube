import 'package:dio/dio.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/data/models/cash_in_out_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/cash_in_out_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class CashInOutRemoteDataSource {
  Future<CashInOutModel> addCashInOut(CashInOutEntity cashInOutEntity);
}

class CashInOutRemoteDataSourceImpl implements CashInOutRemoteDataSource {
  ApiService apiService;
  CashInOutRemoteDataSourceImpl(this.apiService);

  @override
  Future<CashInOutModel> addCashInOut(CashInOutEntity cashInOutEntity) async {
    final result = await apiService.post(
      '${Constants.baseUrl}sales/pos/cash-in-out',
      cashInOutEntity.toJson(),
      Options(
        contentType: Headers.jsonContentType,
      ),
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return CashInOutModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
