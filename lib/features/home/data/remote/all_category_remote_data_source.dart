import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entitis/all_category_entity.dart';
import '../models/all_category_model.dart';

abstract class AllCategoryRemoteDataSource {
  Future<AllCategoryModel> getAllCategory(AllCategoryEntity allCategoryEntity);
}

class AllCategoryRemoteDataSourceImpl implements AllCategoryRemoteDataSource {
  ApiService apiService;

  AllCategoryRemoteDataSourceImpl(this.apiService);

  @override
  Future<AllCategoryModel> getAllCategory(
      AllCategoryEntity allCategoryEntity) async {
    final result = await apiService.postRaw(
      '${Constants.baseUrl}products/search/All',
      allCategoryEntity.toJson(),
      Options(
        contentType: Headers.jsonContentType,
      ),
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return AllCategoryModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'Authentication failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
