import 'package:dartz/dartz.dart';
import 'package:point_of_sale/features/home/data/models/price_list_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/price_list_entity.dart';
import 'package:point_of_sale/features/home/domain/repo/price_list_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/use_case.dart';

class PriceListUseCase extends UseCase<PriceListModel, PriceListEntity> {
  final PriceListRepo priceListRepo;
  PriceListUseCase(this.priceListRepo);
  @override
  Future<Either<Failure, PriceListModel>> call(PriceListEntity params) {
    params.loading(true);
    final result = priceListRepo.getPriceList(params);
    result.then(
      (value) {
        params.loading(false);
      },
    );
    return result;
  }
}
