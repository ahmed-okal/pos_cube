import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/customers_dialog.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../data/models/customers_model.dart';
import '../../getx/controllers/categories_controller.dart';

class CustomerButton extends GetView<CategoriesController> {
  const CustomerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          controller.customersController.getCustomers();
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return const CustomersDialog();
            },
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: AppSize.height(33),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.secondry,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Obx(
              () {
                final selectedId =
                    controller.customersController.selectedCustomerId.value;
                if (selectedId == null) {
                  return Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'customer'.tr,
                    style: AppTextStyle.primary14800,
                  );
                } else {
                  Datum? customer;
                  try {
                    customer = controller
                        .customersController.customersModel.data!
                        .firstWhere((c) => c.id == selectedId);
                  } catch (e) {
                    customer = null;
                  }
                  if (customer == null ||
                      (customer.fullname?.isEmpty ?? true)) {
                    return Text(
                      'customer'.tr,
                      style: AppTextStyle.primary14800,
                    );
                  } else {
                    final name = Get.locale == const Locale('ar', 'EG')
                        ? customer.fullname!.first.text ?? 'customer'.tr
                        : customer.fullname!.last.text ?? 'customer'.tr;
                    return Text(
                      name,
                      style: AppTextStyle.primary14800,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    );
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
