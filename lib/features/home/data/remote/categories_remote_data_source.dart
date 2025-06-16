import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/data/models/categories_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entitis/categories_entity.dart';

abstract class CategoriesRemoteDataSource {
  Future<CatigoriesTaskModel> getCategories(CategoriesEntity categoriesEntity);
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  ApiService apiService;
  CategoriesRemoteDataSourceImpl(this.apiService);
  @override
  Future<CatigoriesTaskModel> getCategories(
      CategoriesEntity categoriesEntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}products/categories/products/${categoriesEntity.tenantId}/${categoriesEntity.companyId}',
    );
    final responseData = result.data;
    if (result.statusCode == 200 || result.statusCode == 201) {
      return CatigoriesTaskModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'Authentication failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
