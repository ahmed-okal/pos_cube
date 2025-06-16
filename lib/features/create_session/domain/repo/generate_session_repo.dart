import 'package:dartz/dartz.dart';
import 'package:point_of_sale/core/errors/failure.dart';
import 'package:point_of_sale/features/create_session/domain/intities/generate_session_intity.dart';

import '../../data/models/generate_session_mosel.dart';

abstract class GenerateSessionRepo {
  Future<Either<Failure, GenerateSessionModel>> generateSession(
    GenerateSessionIntity generateSessionIntity,
  );
}
