import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/home/data/models/price_list_model.dart';

import '../../../../core/errors/failure.dart';
import '../entitis/price_list_entity.dart';

abstract class PriceListRepo {
  Future<Either<Failure, PriceListModel>> getPriceList(
    PriceListEntity priceListEntity,
  );
}
