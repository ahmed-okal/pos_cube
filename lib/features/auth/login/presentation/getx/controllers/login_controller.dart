import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/widgets/failed_snack_bar.dart';
import 'package:point_of_sale/core/widgets/success_snack_bar.dart';
import 'package:point_of_sale/features/auth/login/data/models/login_model.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failure.dart';
import '../../../../../../core/routes/app_pages.dart';
import '../../../../../../core/services/cash_data_source.dart';
import '../../../domain/entitis/login_intity.dart';
import '../../../domain/use_cases/login_use_case.dart';

class LoginController extends GetxController {
  final CashDataSource cashDataSource = Get.put(CashDataSource());
  final RxString userName = ''.obs;
  final RxString userPicture = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginUseCase loginUseCase;

  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final loading = false.obs;
  final TextEditingController otpController = TextEditingController();
  LoginTaskModel loginTaskModel = LoginTaskModel();
  LoginController(this.loginUseCase);
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      String otp = otpController.text;
      final result = await loginUseCase.call(LoginParam(
        loading: loading,
        pinCode: otp,
      ));
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
          loginTaskModel = data;
          cashDataSource.saveAuthDetails(
            loginTaskModel.data!.user!.id!,
            loginTaskModel.data!.token!,
            loginTaskModel.data!.user!.name!,
            loginTaskModel.data!.user!.tenantId!,
            loginTaskModel.data!.user!.companyId!,
            loginTaskModel.data!.user!.branchId!,
            loginTaskModel.data!.company![0].logo!,
          );

          // Save invoice data
          cashDataSource.saveInvoiceData(
            logo: loginTaskModel.data!.company![0].logo ?? '',
            commerce:
                loginTaskModel.data!.company![0].commercialRegisteration ?? '',
            cashierName: loginTaskModel.data!.user!.name ?? 'Cashier',
            restaurantName: loginTaskModel.data!.company![0].name?.first.text ??
                'Restaurant',
            vatNumber: loginTaskModel.data!.company![0].vatNumber ?? '0',
            vat:
                loginTaskModel.data!.company![0].settings?.invoice?[14].value ??
                    '0',
            mainAddress:
                loginTaskModel.data!.company![0].mainAddress?.first.text ??
                    'No Address',
            websiteUrl:
                loginTaskModel.data!.company![0].websiteUrl ?? 'Ahmed M. Okal',
          );

          userName.value = loginTaskModel.data!.user!.name!;

          // Hide keyboard before navigation
          FocusManager.instance.primaryFocus?.unfocus();
          SystemChannels.textInput.invokeMethod('TextInput.hide');

          Get.toNamed(Routes.createSession);
          successSnackBar('loginSuccess'.tr);
        },
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadStoredUserData();
  }

  void loadStoredUserData() {
    userName.value = cashDataSource.box.read('userName') ?? '';
    userPicture.value = cashDataSource.box.read('userPicture') ?? '';
  }
}
