import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import 'actions_dialog_body.dart';

class ActionsButton extends StatelessWidget {
  const ActionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: AppColors.white,
                title: Center(
                  child: Text(
                    'actions'.tr,
                    style: AppTextStyle.primary16800,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppSize.width(50),
                  vertical: AppSize.height(15),
                ),
                scrollable: true,
                content: const ActionsDialogBody(),
              );
            },
          );
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: AppSize.height(33),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.secondry,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              'actions'.tr,
              style: AppTextStyle.primary14800,
            ),
          ),
        ),
      ),
    );
  }
}
