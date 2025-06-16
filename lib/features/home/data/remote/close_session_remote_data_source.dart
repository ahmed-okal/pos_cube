import 'package:dio/dio.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/data/models/close_session_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entitis/close_session_entity.dart';

abstract class CloseSessionRemoteDataSource {
  Future<CloseSessionModel> closeSession(CloseSessionEntity closeSessionIntity);
}

class CloseSessionRemoteDataSourceImpl implements CloseSessionRemoteDataSource {
  ApiService apiService;
  CloseSessionRemoteDataSourceImpl(this.apiService);
  @override
  Future<CloseSessionModel> closeSession(
      CloseSessionEntity closeSessionIntity) async {
    final result = await apiService.putRequest(
      '${Constants.baseUrl}sales/pos/sessions/close/${closeSessionIntity.sessionId}',
      closeSessionIntity.toJson(),
      Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return CloseSessionModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'Close Session failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
