import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/use_case.dart';
import '../../data/models/login_model.dart';
import '../entitis/login_intity.dart';
import '../repo/login_repo.dart';

class LoginUseCase extends UseCase<LoginTaskModel, LoginParam> {
  final LogInRepo loginRepo;
  LoginUseCase(this.loginRepo);

  @override
  Future<Either<Failure, LoginTaskModel>> call(LoginParam params) async {
    params.loading(true);
    final result = loginRepo.login(params);
    result.then((value) {
      params.loading(false);
    });
    return result;
  }
}
