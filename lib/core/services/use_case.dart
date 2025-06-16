import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../errors/failure.dart';

abstract class UseCase<OutPut, Params> {
  Future<Either<Failure, OutPut>> call(Params params);
}

class Param {
  final RxBool loading;
  Param({required this.loading});
}
