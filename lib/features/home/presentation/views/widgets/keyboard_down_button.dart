import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/categories_controller.dart';

class KeyboardDownButton extends GetView<CategoriesController> {
  const KeyboardDownButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          controller.orderController.selectedIndex.value = -1;
        },
        child: AnimatedContainer(
          height: AppSize.height(33),
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: AppColors.green,
            border: Border.all(
              color: AppColors.secondry,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: SvgPicture.asset(
              AppAssets.arrowDownIcon,
              height: AppSize.height(50),
            ),
          ),
        ),
      ),
    );
  }
}
