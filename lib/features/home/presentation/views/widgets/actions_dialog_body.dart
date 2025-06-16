import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';

import '../../../../../core/utils/size_config.dart';
import 'actions_dialog_body_item.dart';

class ActionsDialogBody extends StatelessWidget {
  const ActionsDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(642),
      width: AppSize.width(625),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: AppSize.width(18),
          mainAxisSpacing: AppSize.height(12),
          childAspectRatio: 1.56,
        ),
        children: [
          ActionsDialogBodyItem(
            title: 'generalNote'.tr,
            icon: AppAssets.notesIcon,
          ),
          ActionsDialogBodyItem(
            title: 'quotationOrder'.tr,
            icon: AppAssets.quotationIcon,
          ),
          ActionsDialogBodyItem(
            title: 'split'.tr,
            icon: AppAssets.notesIcon,
          ),
          ActionsDialogBodyItem(
            title: 'transferMerge'.tr,
            icon: AppAssets.notesIcon,
          ),
          ActionsDialogBodyItem(
            title: 'guests'.tr,
            icon: AppAssets.notesIcon,
          ),
          ActionsDialogBodyItem(
            title: 'customerNote'.tr,
            icon: AppAssets.notesIcon,
          ),
          ActionsDialogBodyItem(
            title: 'priceList'.tr,
            icon: AppAssets.priceListIcon,
          ),
          ActionsDialogBodyItem(
            title: 'refund'.tr,
            icon: AppAssets.refundIcon,
          ),
          ActionsDialogBodyItem(
            title: 'tax'.tr,
            icon: AppAssets.taxIcon,
          ),
          ActionsDialogBodyItem(
            title: 'cancelOrder'.tr,
            icon: AppAssets.trashIcon,
            color: AppColors.red,
            style: AppTextStyle.red18700,
          ),
        ],
      ),
    );
  }
}
