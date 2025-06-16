import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/open_session_model.dart';
import '../intities/open_session_intity.dart';

abstract class OpenSessionRepo {
  Future<Either<Failure, OpenSessionModel>> openSession(
      OpenSessionIntity openSessionIntity);
}
