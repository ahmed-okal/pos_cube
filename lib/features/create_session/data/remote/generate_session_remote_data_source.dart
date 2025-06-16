import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/create_session/data/models/generate_session_mosel.dart';
import 'package:point_of_sale/features/create_session/domain/intities/generate_session_intity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class GenerateSessionRemoteDataSource {
  Future<GenerateSessionModel> generateSession(
      GenerateSessionIntity generateSessionIntity);
}

class GenerateSessionRemoteDataSourceImpl
    implements GenerateSessionRemoteDataSource {
  ApiService apiService;
  GenerateSessionRemoteDataSourceImpl(this.apiService);
  @override
  Future<GenerateSessionModel> generateSession(
      GenerateSessionIntity generateSessionIntity) async {
    final result = await apiService.getRequest(
      '${Constants.baseUrl}sales/pos/sessions/gen-code/${generateSessionIntity.tenantId}/${generateSessionIntity.companyId}/${generateSessionIntity.branchId}',
    );
    final responseData = result.data;
    if (result.statusCode == 200 || result.statusCode == 201) {
      return GenerateSessionModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'getCreateNewOrder failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
