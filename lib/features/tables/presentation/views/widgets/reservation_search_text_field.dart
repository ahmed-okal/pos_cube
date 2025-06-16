import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/reservations_controller.dart';

class ReservationSearchTextField extends GetView<ReservationsController> {
  const ReservationSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: AppSize.height(13),
        top: AppSize.height(5),
        start: AppSize.width(20),
        end: AppSize.width(20),
      ),
      child: SizedBox(
        height: AppSize.height(28),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                cursorHeight: AppSize.height(20),
                controller: controller.searchController,
                onChanged: controller.filterReservations,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.8, color: AppColors.lavenderGray),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'search'.tr,
                  hintStyle: AppTextStyle.lavenderGray11600,
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: AppSize.width(9)),
                    child: SvgPicture.asset(
                      AppAssets.searchIcon,
                      height: AppSize.height(14),
                      width: AppSize.height(14),
                    ),
                  ),
                  suffixIcon: controller.searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () {
                            controller.searchController.clear();
                            controller.filterReservations('');
                          },
                        )
                      : null,
                  prefixIconConstraints: BoxConstraints(
                    minHeight: AppSize.height(18),
                    maxHeight: AppSize.height(18),
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSize.width(8)),
            Container(
              height: AppSize.height(28),
              width: AppSize.height(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(width: 1, color: AppColors.lavenderGray),
                color: AppColors.white,
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.filterIcon,
                  height: AppSize.height(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
