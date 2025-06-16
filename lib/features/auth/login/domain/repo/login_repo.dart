import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../data/models/login_model.dart';
import '../entitis/login_intity.dart';

abstract class LogInRepo {
  Future<Either<Failure, LoginTaskModel>> login(LoginParam loginParam);
}
