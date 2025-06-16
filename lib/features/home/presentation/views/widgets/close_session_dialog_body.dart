import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/close_session_controller.dart';
import 'close_cash_text_field.dart';
import 'close_notes_text_field.dart';
import 'close_register_money_counter.dart';

class CloseSessionDialogBody extends GetView<CloseSessionController> {
  const CloseSessionDialogBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(672),
      width: AppSize.width(725),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: AppSize.height(30),
                width: AppSize.width(81),
                decoration: BoxDecoration(
                  color: AppColors.third,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '0 ',
                      style: AppTextStyle.primary16800,
                    ),
                    Text(
                      'order'.tr,
                      style: AppTextStyle.primary16800,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: AppSize.width(52),
              ),
              Container(
                height: AppSize.height(30),
                width: AppSize.width(81),
                decoration: BoxDecoration(
                  color: AppColors.third,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '0.00 ',
                      style: AppTextStyle.primary16800,
                    ),
                    Text(
                      'SR'.tr,
                      style: AppTextStyle.primary16800,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppSize.height(21),
          ),
          const Divider(
            thickness: 1.5,
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary18800,
            itemName: 'cash'.tr,
            itemPrice: '0.00',
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary16600,
            itemName: 'opening'.tr,
            itemPrice: '0.00',
          ),
          Obx(
            () => controller.getCashInOutController.loading.isTrue
                ? const CircularProgressIndicator()
                : CloseRegisterMoneyCounter(
                    textStyle: AppTextStyle.primary16600,
                    itemName: 'cashInOut'.tr,
                    itemPrice:
                        controller.getCashInOutController.netCash.toString(),
                  ),
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary16600,
            itemName: 'counted'.tr,
            itemPrice: '0.00',
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary16600,
            itemName: 'difference'.tr,
            itemPrice: '0.00',
          ),
          Divider(
            thickness: 1.5,
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary18800,
            itemName: 'card'.tr,
            itemPrice: '0.00',
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary16600,
            itemName: 'counted'.tr,
            itemPrice: '0.00',
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary16600,
            itemName: 'difference'.tr,
            itemPrice: '0.00',
          ),
          const Divider(
            thickness: 1.5,
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary18800,
            itemName: 'customerAccount'.tr,
            itemPrice: '0.00',
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary16600,
            itemName: 'counted'.tr,
            itemPrice: '0.00',
          ),
          CloseRegisterMoneyCounter(
            textStyle: AppTextStyle.primary16600,
            itemName: 'difference'.tr,
            itemPrice: '0.00',
          ),
          const Divider(
            thickness: 1.5,
          ),
          const ClosingSessionFields(),
          SizedBox(
            height: AppSize.height(16),
          ),
          const CloseSessionButtom(),
        ],
      ),
    );
  }
}

class CloseSessionButtom extends GetView<CloseSessionController> {
  const CloseSessionButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: InkWell(
        onTap: () {
          controller.closeSession();
          Get.offAllNamed(Routes.createSession);
        },
        child: Container(
          height: AppSize.height(41),
          width: AppSize.width(210),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'closeSession'.tr,
              style: AppTextStyle.white18800,
            ),
          ),
        ),
      ),
    );
  }
}

class ClosingSessionFields extends StatelessWidget {
  const ClosingSessionFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'cashCount'.tr,
                style: AppTextStyle.primary18800,
              ),
            ),
            SizedBox(
              height: AppSize.height(8),
            ),
            SizedBox(
              height: AppSize.height(41),
              width: AppSize.width(186),
              child: CloseCashTextField(),
            ),
          ],
        ),
        SizedBox(
          width: AppSize.width(12),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'note'.tr,
              style: AppTextStyle.primary18800,
            ),
            SizedBox(
              height: AppSize.height(8),
            ),
            SizedBox(
              height: AppSize.height(121),
              width: AppSize.width(467),
              child: CloseNotesTextField(),
            ),
          ],
        ),
      ],
    );
  }
}
