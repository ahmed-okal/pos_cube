import 'package:dio/dio.dart';
import 'package:point_of_sale/core/services/api_service.dart';
import 'package:point_of_sale/features/home/data/models/kitchen_note_model.dart';
import 'package:point_of_sale/features/home/domain/entitis/kitchen_note_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';

abstract class KitchenNoteRemoteDataSource {
  Future<KitchenNotesModel> addKitchenNote(KitchenNoteEntity kitchenNoteEntity);
}

class KitchenNoteRemoteDataSourceImpl implements KitchenNoteRemoteDataSource {
  ApiService apiService;
  KitchenNoteRemoteDataSourceImpl(this.apiService);

  @override
  Future<KitchenNotesModel> addKitchenNote(
      KitchenNoteEntity kitchenNoteEntity) async {
    final result = await apiService.post(
      '${Constants.baseUrl}sales/pos/orders/kitchen-notes',
      kitchenNoteEntity.toJson(),
      Options(
        contentType: Headers.jsonContentType,
      ),
    );
    final responseData = result.data;

    if (result.statusCode == 200 || result.statusCode == 201) {
      return KitchenNotesModel.fromJson(result.data);
    } else {
      throw AppExceptions(
        message: responseData['message'] ?? 'failed',
        statusCode: result.statusCode,
        data: responseData,
      );
    }
  }
}
