import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/get_tables_entity.dart';
import '../models/tables_model.dart';

abstract class GetTablesRemoteDataSource {
  Future<TablesModel> getTables(GetTablesEntity getTablesEntity);
}

class GetTablesRemoteDataSourceImpl extends GetTablesRemoteDataSource {
  ApiService apiService;
  GetTablesRemoteDataSourceImpl(this.apiService);
  @override
  Future<TablesModel> getTables(GetTablesEntity getTablesEntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}sales/pos/tables/places-tables/${getTablesEntity.tenantId}/${getTablesEntity.companyId}/${getTablesEntity.branchId}',
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return TablesModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'getCreateNewOrder failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
