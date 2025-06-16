import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/intities/open_session_intity.dart';
import '../models/open_session_model.dart';

abstract class OpenSessionRemoteDataSource {
  Future<OpenSessionModel> openSession(OpenSessionIntity openSessionIntity);
}

class OpenSessionRemoteDataSourceImpl implements OpenSessionRemoteDataSource {
  ApiService apiService;
  OpenSessionRemoteDataSourceImpl(this.apiService);
  @override
  Future<OpenSessionModel> openSession(
      OpenSessionIntity openSessionIntity) async {
    final result = await apiService.postRaw(
      '${Constants.baseUrl}sales/pos/sessions/open',
      openSessionIntity.toJson(),
      Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );
    final responseData = result.data;
    if (result.statusCode == 200 || result.statusCode == 201) {
      return OpenSessionModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'getCreateNewOrder failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
