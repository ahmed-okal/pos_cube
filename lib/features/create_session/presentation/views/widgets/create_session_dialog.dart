import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/responsive.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/create_session_controller.dart';
import 'open_cash_text_field.dart';
import 'open_note_text_field.dart';

class CreateSessionDialog extends GetView<CreateSessionController> {
  const CreateSessionDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width(940),
      height: Responsive.isMobile(context)
          ? AppSize.height(700)
          : AppSize.height(506),
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.width(51),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: AppSize.height(21),
          ),
          Center(
            child: Text(
              'createSession'.tr,
              style: AppTextStyle.primary30600,
            ),
          ),
          SizedBox(
            height: AppSize.height(34),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'openingCash'.tr,
                textAlign: TextAlign.center,
                style: AppTextStyle.primary20700,
              ),
              SizedBox(
                width: AppSize.width(16),
              ),
              SizedBox(
                height: AppSize.height(54),
                width: AppSize.width(188),
                child: const OpenCashTextField(),
              ),
            ],
          ),
          SizedBox(
            height: AppSize.height(15),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: AppSize.height(6),
                ),
                child: Text(
                  'openingNote'.tr,
                  style: AppTextStyle.primary20700,
                ),
              ),
              SizedBox(
                width: AppSize.width(16),
              ),
              Expanded(
                child: const OpenNoteTextField(),
              ),
            ],
          ),
          SizedBox(
            height: AppSize.height(34),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: AppSize.height(47),
                  width: AppSize.width(132),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'cancel'.tr,
                      style: AppTextStyle.primary20600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppSize.width(21),
              ),
              InkWell(
                onTap: () {
                  controller.openSessionController.openSession(
                    controller.generateSessionModel.data?.sessionCode ?? '',
                  );
                  Get.back();
                },
                child: Container(
                  height: AppSize.height(47),
                  width: AppSize.width(186),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'createSession'.tr,
                      style: AppTextStyle.white20600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
