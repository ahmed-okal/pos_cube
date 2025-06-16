import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/customers_container_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../getx/controllers/customers_controller.dart';

class CustomersListView extends GetView<CustomersController> {
  const CustomersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.separated(
          itemCount: controller.filteredCustomers.length,
          separatorBuilder: (context, index) => Divider(
            height: 0,
            thickness: 0.5,
            color: AppColors.lavenderGray,
          ),
          itemBuilder: (context, index) {
            final customer = controller.filteredCustomers[index];
            return CustomerContainerWidget(
              index: index,
              customer: customer,
            );
          },
        ),
      ),
    );
  }
}
