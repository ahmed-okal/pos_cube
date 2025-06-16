import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/search_controller.dart';

class AppBarSearch extends GetView<SearchFoodController> {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  const AppBarSearch({
    super.key,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GetBuilder<SearchFoodController>(
        builder: (controller) {
          return Material(
            elevation: controller.isFocused.value ? 4 : 0,
            borderRadius: BorderRadius.circular(8),
            child: TextField(
              controller: controller.search,
              focusNode: controller.focusNode,
              onChanged: (value) {
                onChanged?.call(value);
                controller.searchFood();
              },
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: 'search'.tr,
                hintStyle: AppTextStyle.grey16600,
                prefixIcon: IconButton(
                  onPressed: () {
                    controller.searchFood();
                  },
                  icon: SvgPicture.asset(
                    height: AppSize.height(18),
                    AppAssets.searchIcon,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 2,
                    color: AppColors.grey3,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.grey3,
                    width: 1,
                  ),
                ),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 20,
                ),
              ),
              style: AppTextStyle.primary16800,
            ),
          );
        },
      ),
    );
  }
}
