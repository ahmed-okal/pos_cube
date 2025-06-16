import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/data/models/get_cash_in_out_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/get_cash_in_out_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class GetCashInOutRemoteDataSource {
  Future<GetCashInOutModel> getCashInOut(GetCashInOutEntity getCashInOutEntity);
}

class GetCashInOutRemoteDataSourceImpl implements GetCashInOutRemoteDataSource {
  ApiService apiService;
  GetCashInOutRemoteDataSourceImpl(this.apiService);

  @override
  Future<GetCashInOutModel> getCashInOut(
      GetCashInOutEntity getCashInOutEntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}sales/pos/cash-in-out/${getCashInOutEntity.tenantId}/${getCashInOutEntity.companyId}/${getCashInOutEntity.branchId}/${getCashInOutEntity.sessionId}',
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return GetCashInOutModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
