import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/data/models/price_list_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/price_list_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class PriceListRemoteDataSource {
  Future<PriceListModel> getPriceList(PriceListEntity priceListEntity);
}

class PriceListRemoteDataSourceImpl implements PriceListRemoteDataSource {
  ApiService apiService;
  PriceListRemoteDataSourceImpl(this.apiService);

  @override
  Future<PriceListModel> getPriceList(PriceListEntity priceListEntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}sales/inventory/list-price/${priceListEntity.tenantId}/${priceListEntity.companyId}/${priceListEntity.branchId}',
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return PriceListModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
