import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/customers_controller.dart';
import 'package:point_of_sale/features/home/presentation/views/widgets/add_customer_button.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/loading_widget.dart';
import 'customers_dialog_action_buttons.dart';
import 'customers_dialog_buttons.dart';
import 'customers_list_view.dart';
import 'customers_search_field.dart';
import 'customers_titles_container.dart';

class CustomersDialogBody extends GetView<CustomersController> {
  const CustomersDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height(612),
      width: AppSize.width(796),
      child: Obx(
        () => controller.loading.isTrue
            ? const LoadingWidget()
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomersSearchField(),
                      ),
                      SizedBox(
                        width: AppSize.width(9),
                      ),
                      AddCustomerButton(),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.height(30),
                  ),
                  CustomersTitlesContainer(),
                  CustomersListView(),
                  SizedBox(
                    height: AppSize.height(20),
                  ),
                  CustomersDialogActionButtons(),
                  CustomersDialogButtons(),
                ],
              ),
      ),
    );
  }
}
