import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_address_data.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_address_name.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/add_customer_controller.dart';

class AddCustomerAddressPageViewBuilder extends GetView<AddCustomerController> {
  const AddCustomerAddressPageViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      itemCount: controller.addresses.length,
      // physics: const NeverScrollableScrollPhysics(),
      onPageChanged: controller.onPageChanged,
      itemBuilder: (context, index) {
        return Column(
          children: [
            AddCustomerAddressName(
              title: 'addressName'.tr,
              hint: 'home'.tr,
              height: AppSize.height(36),
              controller: controller.addressNameControllers[index],
            ),
            SizedBox(height: AppSize.height(8)),
            Row(
              children: [
                Expanded(
                  child: AddNewCustomerAddressData(
                    title: 'street'.tr,
                    hint: 'Abd Elhaleem Radwan',
                    keyboardType: TextInputType.name,
                    controller: controller.streetControllers[index],
                    // validator: (val) {
                    //   if (val == null || val.trim().isEmpty) {
                    //     return 'Street is required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                SizedBox(
                  width: AppSize.width(17.5),
                ),
                Expanded(
                  child: AddNewCustomerAddressData(
                    title: 'buildingNumber'.tr,
                    hint: 'buildingNumber'.tr,
                    controller: controller.buildingControllers[index],
                    keyboardType: TextInputType.name,
                    // not required, so no validator
                  ),
                ),
                SizedBox(
                  width: AppSize.width(17.5),
                ),
                Expanded(
                  child: AddNewCustomerAddressData(
                    title: 'apartmentNumber'.tr,
                    hint: '12',
                    controller: controller.apartmentControllers[index],
                    keyboardType: TextInputType.name,
                    // not required
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.height(8),
            ),
            Row(
              children: [
                Expanded(
                  child: AddNewCustomerAddressData(
                    title: 'city'.tr,
                    hint: 'riyadh'.tr,
                    controller: controller.cityControllers[index],
                    keyboardType: TextInputType.name,
                    // validator: (val) {
                    //   if (val == null || val.trim().isEmpty) {
                    //     return 'City is required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                SizedBox(
                  width: AppSize.width(17.5),
                ),
                Expanded(
                  child: AddNewCustomerAddressData(
                    title: 'region'.tr,
                    hint: 'riyadh'.tr,
                    controller: controller.regionControllers[index],
                    keyboardType: TextInputType.name,
                    // validator: (val) {
                    //   if (val == null || val.trim().isEmpty) {
                    //     return 'Region is required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                SizedBox(
                  width: AppSize.width(17.5),
                ),
                Expanded(
                  child: AddNewCustomerAddressData(
                    title: 'zipCode'.tr,
                    hint: '123456',
                    controller: controller.zipControllers[index],
                    keyboardType: TextInputType.number,
                    // validator: (val) {
                    //   if (val!.length > 6) {
                    //     return 'Zip Code is required';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.height(8),
            ),
            AddCustomerAddressName(
              title: 'discription'.tr,
              hint: '',
              controller: controller.descControllers[index],
              height: AppSize.height(36),
              // description optional, so no validator
            ),
            SizedBox(
              height: AppSize.height(10),
            ),
          ],
        );
      },
    );
  }
}
