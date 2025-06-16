import 'package:dio/dio.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/data/models/search_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/search_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class SearchRemoteDataSource {
  Future<SearchModel> search(SearchEntity searchEntity);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  ApiService apiService;
  SearchRemoteDataSourceImpl(this.apiService);
  @override
  Future<SearchModel> search(SearchEntity searchEntity) async {
    final result = await apiService.postRaw(
      '${Constants.baseUrl}products/search/${searchEntity.name}',
      searchEntity.toJson(),
      Options(
        contentType: Headers.jsonContentType,
      ),
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return SearchModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'Search failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
