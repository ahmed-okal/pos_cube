import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/data/models/search_model.dart';
import 'package:point_of_sale/features/home/domain/use_case/search_use_case.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/services/cash_data_source.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../domain/entitis/search_entity.dart';

class SearchFoodController extends GetxController {
  final TextEditingController search = TextEditingController();
  final loading = false.obs;
  final isSearch = false.obs;
  final SearchUseCase searchUseCase;
  final CashDataSource cashDataSource = Get.find<CashDataSource>();
  SearchFoodController(this.searchUseCase);

  var searchModel = SearchModel().obs;
  final FocusNode focusNode = FocusNode();
  final RxBool isFocused = false.obs;

  @override
  void onInit() {
    super.onInit();
    search.addListener(() {
      if (search.text.trim().isNotEmpty) {
        searchFood();
      }
      update();
    });
    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;
      if (focusNode.hasFocus) {
        isSearch.value = true;
      } else {
        if (search.text.trim().isEmpty) {
          isSearch.value = false;
        }
      }
      update();
    });
  }

  Future<void> searchFood() async {
    if (search.text.trim().isEmpty) {
      isSearch.value = false;
      searchModel.value = SearchModel();
      return;
    }
    if (focusNode.hasFocus) {
      isSearch.value = true;
    }
    loading.value = true;
    try {
      final result = await searchUseCase(
        SearchEntity(
          loading: loading,
          name: search.text,
          tenantId: cashDataSource.box.read('tenantId'),
          companyId: cashDataSource.box.read('companyId'),
        ),
      );

      result.fold(
        (failure) {
          String errorMessage;
          if (failure is ServerFailure) {
            errorMessage = failure.message;
          } else if (failure is AppExceptions) {
            errorMessage = failure.message;
          } else {
            errorMessage = 'somethingWentWrongPleaseTryAgainLater'.tr;
          }

          failedSnaskBar(errorMessage);
        },
        (data) {
          searchModel.value = data;
        },
      );
    } finally {
      loading.value = false;
    }
  }
}
