import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/customers_controller.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';

class CustomersSearchField extends GetView<CustomersController> {
  const CustomersSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(36),
      child: TextField(
        onChanged: (value) {
          controller.filterCustomers(value);
        },
        decoration: InputDecoration(
          hintText: 'searchCustomers'.tr,
          hintStyle: AppTextStyle.grey14600,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              height: AppSize.height(16),
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
              color: AppColors.lavenderGray,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.lavenderGray,
              width: 1,
            ),
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: AppSize.width(8),
          ),
        ),
        style: AppTextStyle.primary16800,
      ),
    );
  }
}
