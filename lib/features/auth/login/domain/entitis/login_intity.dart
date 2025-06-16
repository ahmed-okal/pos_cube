import '../../../../../core/services/use_case.dart';

class LoginParam extends Param {
  String pinCode;

  LoginParam({required super.loading, required this.pinCode});
  Map<String, dynamic> toJson() {
    return {'pinCode': pinCode};
  }
}
