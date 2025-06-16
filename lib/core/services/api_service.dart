import 'package:dio/dio.dart' as dio; // Add prefix here
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/core/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'cash_data_source.dart';

class ApiService {
  late dio.Dio _dio; // Use prefixed type
  final CashDataSource _cashDataSource = Get.find();
  // dio.HttpClientAdapter k = BrowserHttpClientAdapter()..withCredentials = true;

  ApiService() {
    _initializeDio();
  }

  void _initializeDio() {
    dio.BaseOptions options = dio.BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      headers: {
        'Content-Type': 'application/json',
      },
      validateStatus: (status) {
        return status != null && status < 500;
      },
    );

    _dio = dio.Dio(options);
    _addInterceptors();
  }

  void _addInterceptors() {
    // final cookieJar = CookieJar();
    // _dio.interceptors.add(CookieManager(cookieJar));
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
      maxWidth: 100,
    ));

    _dio.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = _cashDataSource.box.read('authToken');
          if (token != null) {
            options.headers['Cookie'] = 'jwt_token=$token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.data is Map && response.data['success'] == false) {
            return handler.reject(
              dio.DioException(
                requestOptions: response.requestOptions,
                response: response,
                error: response.data['message'] ?? 'unknownError'.tr,
              ),
            );
          }
          return handler.next(response);
        },
        onError: (dio.DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Handle token refresh here if needed
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<dio.Response> _handleRequest(
      Future<dio.Response> Function() requestFunction) async {
    try {
      final response = await requestFunction();
      return response;
    } on dio.DioException catch (e) {
      throw ServerFailure(e.toString());
    } catch (e) {
      throw ServerFailure('generalError'.tr);
    }
  }

  Future<dio.Response> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    dio.Options? options,
  }) async {
    return _handleRequest(() async {
      return await _dio.get(
        endpoint,
        queryParameters: queryParams,
        options: options,
      );
    });
  }

  Future<dio.Response> putRequest(
    String endpoint,
    Map<String, dynamic> data,
    dio.Options options,
  ) async {
    return _handleRequest(() async {
      return await _dio.put(
        endpoint,
        data: data,
        options: options,
      );
    });
  }

  Future<dio.Response> deleteRequest(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParams,
    dio.Options? options,
  }) async {
    return _handleRequest(() async {
      return await _dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: options,
      );
    });
  }

  Future<dio.Response> postRaw(
    String endpoint,
    Map<String, dynamic> data,
    dio.Options options,
  ) async {
    return _handleRequest(() async {
      return await _dio.post(endpoint, data: data, options: options);
    });
  }

  Future<dio.Response> post(
    String endpoint,
    Map<String, dynamic> data,
    dio.Options options,
  ) async {
    return _handleRequest(() async {
      final formData = dio.FormData.fromMap(data);
      return await _dio.post(
        endpoint,
        data: formData,
        options: options,
      );
    });
  }
}
