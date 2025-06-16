import 'package:dio/dio.dart';
import 'package:point_of_sale/features/auth/login/data/models/login_model.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/services/api_service.dart';
import '../../domain/entitis/login_intity.dart';

abstract class LoginRemoteDataSource {
  Future<LoginTaskModel> login(LoginParam loginParam);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<LoginTaskModel> login(LoginParam loginParam) async {
    final result = await apiService.postRaw(
      'auth/users/login',
      loginParam.toJson(),
      Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    final responseData = result.data;
    if (result.statusCode == 200 && responseData['status'] == 1) {
      return LoginTaskModel.fromJson(responseData);
    }

    throw AppExceptions(
      message: responseData['message'] ?? 'Authentication failed',
      statusCode: result.statusCode,
      data: responseData,
    );
  }
}
