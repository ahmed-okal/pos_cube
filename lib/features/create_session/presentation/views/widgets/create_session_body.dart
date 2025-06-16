import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/widgets/language_drop_down_button.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/create_session_controller.dart';
import 'create_session_button_action.dart';

class CreateSessionBody extends GetView<CreateSessionController> {
  const CreateSessionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: AppSize.width(50),
            top: AppSize.height(21),
          ),
          child: LanguageDropDownButton(),
        ),
        SizedBox(
          height: AppSize.height(51),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logoPOSUBE,
                height: AppSize.height(117),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: AppSize.width(31),
                  end: AppSize.width(18),
                ),
                child: SizedBox(
                  height: AppSize.height(97),
                  child: VerticalDivider(
                    color: AppColors.grey,
                    width: AppSize.width(3),
                  ),
                ),
              ),
              Column(
                children: [
                  Obx(
                    () => Center(
                      child: Text(
                        controller.clockController.time.value,
                        style: AppTextStyle.primary43800,
                      ),
                    ),
                  ),
                  Obx(
                    () => Center(
                      child: Text(
                        controller.clockController.date.value,
                        style: AppTextStyle.primary22600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: AppSize.height(68),
        ),
        Center(
          child: const CreateSessionButtonAction(),
        ),
      ],
    );
  }
}
