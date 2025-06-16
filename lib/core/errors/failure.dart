import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connectionTimeout'.tr);
      case DioExceptionType.sendTimeout:
        return ServerFailure('sendTimeout'.tr);
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receiveTimeout'.tr);
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate'.tr);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('requestCanceled'.tr);
      case DioExceptionType.connectionError:
        return ServerFailure('noInternetConnection'.tr);
      case DioExceptionType.unknown:
        return ServerFailure('unknownError'.tr);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('userNotFound'.tr);
    } else if (statusCode == 500) {
      return ServerFailure('serverProblem'.tr);
    } else if (statusCode == 409 ||
        statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403) {
      return ServerFailure(response['message']);
    } else {
      return ServerFailure('generalError'.tr);
    }
  }
}
