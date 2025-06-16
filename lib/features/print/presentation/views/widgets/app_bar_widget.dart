import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/core/utils/size_utils.dart';
import 'package:point_of_sale/features/print/presentation/getx/controllers/print_controller.dart';

import '../../../../../core/utils/size_config.dart';

class PrintAppBar extends GetView<PrintController>
    implements PreferredSizeWidget {
  const PrintAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const Border(
        bottom: BorderSide(
          color: AppColors.grey1,
          width: 1,
        ),
      ),
      toolbarHeight: AppSize.height(85),
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
      automaticallyImplyLeading: false,
      leadingWidth: AppSize.width(270),
      centerTitle: true,
      leading: Row(
        children: [
          SizedBox(width: AppSize.width(50)),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: getSize(32),
                color: AppColors.green,
              ),
            );
          }),
          SizedBox(width: AppSize.width(18)),
          Container(
            height: AppSize.height(34),
            width: AppSize.height(34),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkGreen,
            ),
            child: Center(
              child: Text(
                controller.loginController.userName.value.isNotEmpty
                    ? controller.loginController.userName.value.substring(0, 1)
                    : '',
                style: AppTextStyle.white17600,
              ),
            ),
          ),
          SizedBox(width: AppSize.width(15)),
          Text(
            controller.loginController.userName.value.isNotEmpty
                ? controller.loginController.userName.value
                : '',
            style: AppTextStyle.darkgreen14600,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: AppSize.width(51),
          ),
          child: Image.asset(
            AppAssets.appBarLogo,
            height: AppSize.height(50),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSize.height(85));
}
