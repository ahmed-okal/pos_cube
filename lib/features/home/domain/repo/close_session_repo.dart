import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/home/data/models/close_session_model.dart';

import '../../../../core/errors/failure.dart';
import '../entitis/close_session_entity.dart';

abstract class CloseSessionRepo {
  Future<Either<Failure, CloseSessionModel>> closeSession(
      CloseSessionEntity closeSessionIntity);
}
