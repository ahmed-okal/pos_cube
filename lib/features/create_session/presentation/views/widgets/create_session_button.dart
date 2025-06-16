import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class CreateSessionButton extends StatelessWidget {
  const CreateSessionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height(96),
      width: AppSize.height(419),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGrey,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 4,
              color: AppColors.black.withAlpha(75),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.addIcon,
            height: AppSize.height(38),
          ),
          SizedBox(
            width: AppSize.width(8),
          ),
          Text(
            'createSession'.tr,
            style: AppTextStyle.primary30600,
          ),
        ],
      ),
    );
  }
}
