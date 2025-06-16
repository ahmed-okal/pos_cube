import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/customers_contact_info.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../data/models/customers_model.dart';
import '../../getx/controllers/customers_controller.dart';

class CustomerContainerWidget extends GetView<CustomersController> {
  final int index;
  final Datum customer;

  const CustomerContainerWidget({
    super.key,
    required this.index,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toggleSelection(customer.id ?? '');
      },
      child: Obx(
        () => Container(
          color: controller.selectedCustomerId.value == customer.id
              ? AppColors.customerSelcet
              : AppColors.white,
          constraints: BoxConstraints(
            minHeight: AppSize.height(61),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.width(16),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  Get.locale == const Locale('ar', 'EG')
                      ? (customer.fullname?.isNotEmpty ?? false
                          ? customer.fullname!.first.text ?? ''
                          : '')
                      : (customer.fullname?.isNotEmpty ?? false
                          ? customer.fullname!.last.text ?? ''
                          : ''),
                  style: AppTextStyle.darkGray11600,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  (customer.customerAddresses != null &&
                          customer.customerAddresses!.isNotEmpty)
                      ? customer.customerAddresses!.first.name ?? ''
                      : '',
                  style: AppTextStyle.darkGray11600,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  (customer.customerAddresses != null &&
                          customer.customerAddresses!.isNotEmpty)
                      ? customer.customerAddresses!.first.city ?? ''
                      : '',
                  style: AppTextStyle.darkGray11600,
                ),
              ),
              Expanded(
                flex: 6,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: AppSize.width(150),
                    ),
                    child: Text(
                      (customer.customerAddresses != null &&
                              customer.customerAddresses!.isNotEmpty)
                          ? '${customer.customerAddresses!.last.street ?? ''} ${customer.customerAddresses!.last.region ?? ''} ${customer.customerAddresses!.last.city ?? ''}'
                          : '',
                      style: AppTextStyle.darkGray11600.copyWith(height: 1.8),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  child: Row(
                    children: [
                      Text(
                        '0 ',
                        style: AppTextStyle.darkGray11600,
                      ),
                      Text(
                        'SR'.tr,
                        style: AppTextStyle.darkGray11600,
                      ),
                    ],
                  ),
                ),
              ),
              CustomersContactInfo(
                customer: customer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
