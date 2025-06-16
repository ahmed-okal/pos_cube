import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/add_customer_controller.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_address_page_view.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_address_tabs.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_data.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_group_drop_down_button.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_price_list_drop_down_button.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_type_drop_down_button.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/loading_widget.dart';

class AddCustomerDialogBody extends GetView<AddCustomerController> {
  const AddCustomerDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(580),
      width: AppSize.width(798),
      child: Obx(
        () => (controller.priceListController.loading.isTrue ||
                controller.customersGroupController.loading.isTrue)
            ? const LoadingWidget()
            : Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Row(
                      spacing: AppSize.width(18),
                      children: [
                        AddNewCustomerData(
                          title: 'name(arabic)'.tr,
                          hint: 'enterYourName'.tr,
                          controller: controller.arName,
                          keyboardType: TextInputType.text,
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) {
                              return 'ar Name is required';
                            }
                            return null;
                          },
                        ),
                        AddNewCustomerData(
                          title: 'name(english)'.tr,
                          hint: 'enterYourName'.tr,
                          controller: controller.enName,
                          keyboardType: TextInputType.text,
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) {
                              return 'en Name is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.height(8),
                    ),
                    Row(
                      spacing: AppSize.width(18),
                      children: [
                        AddNewCustomerData(
                          title: 'email'.tr,
                          hint: 'enterYourEmail'.tr,
                          controller: controller.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        AddNewCustomerData(
                          maxLength: 11,
                          title: 'phoneNumber'.tr,
                          hint: 'enterYourPhone'.tr,
                          controller: controller.mobileNumber,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (val) {
                            if (val == null || val.trim().isEmpty) {
                              return 'phone number is required';
                            } else if (val.length > 10) {
                              return '';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.height(8),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'customerType'.tr,
                              style: AppTextStyle.primary16700,
                            ),
                            SizedBox(
                              height: AppSize.height(8),
                            ),
                            AddCustomerTypeDropDownButton(),
                          ],
                        ),
                        SizedBox(
                          width: AppSize.width(16.5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'priceList'.tr,
                              style: AppTextStyle.primary16700,
                            ),
                            SizedBox(
                              height: AppSize.height(8),
                            ),
                            PriceListDropdown(),
                          ],
                        ),
                        SizedBox(
                          width: AppSize.width(16.5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'customerGroup'.tr,
                              style: AppTextStyle.primary16700,
                            ),
                            SizedBox(
                              height: AppSize.height(8),
                            ),
                            Container(
                              height: AppSize.height(36),
                              width: AppSize.width(255),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryWithOpacity2,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: AddCustomerGroupDropDownButton(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.height(12),
                    ),
                    AddressTabsWidget(),
                    SizedBox(
                      height: AppSize.height(8),
                    ),
                    Expanded(
                      // child: Obx(
                      //   () {
                      child: AddCustomerAddressPageViewBuilder(),
                      // },
                      // ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
