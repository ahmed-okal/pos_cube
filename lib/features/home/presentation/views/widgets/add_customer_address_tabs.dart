import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/add_customer_controller.dart';

class AddressTabsWidget extends GetView<AddCustomerController> {
  const AddressTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppSize.height(33),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.addresses.length + 1,
                itemBuilder: (context, index) {
                  if (index < controller.addresses.length) {
                    return Obx(() {
                      final isSelected =
                          controller.selectedIndex.value == index;
                      return Padding(
                        padding: EdgeInsetsDirectional.only(
                          end: AppSize.width(6),
                        ),
                        child: InkWell(
                          onTap: () => controller.selectIndex(index),
                          child: AnimatedContainer(
                            width: AppSize.width(94),
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primaryWithOpacity3
                                  : Colors.transparent,
                              border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryWithOpacity3
                                      : AppColors.primaryWithOpacity2),
                              borderRadius: const BorderRadiusDirectional.only(
                                topEnd: Radius.circular(6),
                                topStart: Radius.circular(6),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                controller.addresses[index],
                                style: isSelected
                                    ? AppTextStyle.primary14800
                                    : AppTextStyle.lavenderGray14800,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  }
                  return InkWell(
                    onTap: controller.addAddress,
                    child: Container(
                      width: AppSize.height(25),
                      height: AppSize.height(25),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        '+',
                        style: AppTextStyle.white20800,
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(
              height: 0,
              color: AppColors.primaryWithOpacity3,
            ),
          ],
        );
      },
    );
  }
}
