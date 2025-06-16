import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';
import 'package:point_of_sale/core/utils/size_utils.dart';
import 'package:point_of_sale/features/auth/login/presentation/getx/controllers/login_controller.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/app_bar_search.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/utils/size_config.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/home_body.dart';

class HomeView extends GetView<LoginController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width ~/
        (Responsive.isMobile(context) ? 100 : 320);
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: AppColors.grey1,
            width: 1,
          ),
        ),
        toolbarHeight: Responsive.isMobile(context)
            ? AppSize.height(120)
            : AppSize.height(85),
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        leadingWidth: AppSize.width(270),
        centerTitle: true,
        title: SizedBox(
          height: AppSize.height(36),
          width: AppSize.width(534),
          child: AppBarSearch(),
        ),
        leading: Row(
          children: [
            SizedBox(
              width: AppSize.width(50),
            ),
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
            SizedBox(
              width: AppSize.width(18),
            ),
            Container(
              height: AppSize.height(34),
              width: AppSize.height(34),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkGreen,
              ),
              child: Center(
                child: Text(
                  controller.userName.value.isNotEmpty
                      ? controller.userName.value.substring(0, 1)
                      : '',
                  style: AppTextStyle.white17600,
                ),
              ),
            ),
            SizedBox(
              width: AppSize.width(15),
            ),
            Text(
              controller.userName.value.isNotEmpty
                  ? controller.userName.value
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
      ),
      drawer: Drawer(
        backgroundColor: AppColors.white,
        width: AppSize.width(372),
        child: const CustomDrawer(),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: HomeBody(
          crossAxisCount: crossAxisCount,
        ),
      ),
    );
  }
}
