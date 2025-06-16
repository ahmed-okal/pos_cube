import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/tables/presentation/getx/controllers/reservations_controller.dart';
import 'package:point_of_sale/features/tables/presentation/views/widgets/tables_view_body.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/utils/size_utils.dart';
import '../../../home/presentation/views/widgets/custom_drawer.dart';
import '../getx/controllers/tables_controller.dart';

class TablesView extends GetView<TablesController> {
  const TablesView({super.key});
  @override
  Widget build(BuildContext context) {
    final reservationsController = Get.find<ReservationsController>();
    return RefreshIndicator(
      onRefresh: () async {
        await controller.getTables();
        await reservationsController.getReservations();
      },
      child: Scaffold(
          appBar: AppBar(
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
            // title: SizedBox(
            //   height: AppSize.height(36),
            //   width: AppSize.width(534),
            //   child: const AppBarSearch(),
            // ),
            leading: Row(
              children: [
                SizedBox(
                  width: AppSize.width(50),
                ),
                Builder(
                  builder: (context) {
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
                  },
                ),
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
                      controller.loginController.userName.value.isNotEmpty
                          ? controller.loginController.userName.value
                              .substring(0, 1)
                          : '',
                      style: AppTextStyle.white17600,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppSize.width(15),
                ),
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
          ),
          drawer: Drawer(
            backgroundColor: AppColors.white,
            width: AppSize.width(372),
            child: const CustomDrawer(),
          ),
          body: const TablesViewBody()),
    );
  }
}
