import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/create_new_order_controller.dart';

import '../../../../../core/utils/size_config.dart';
import 'add_order_button.dart';
import 'orders_list_view.dart';

class OrdersNumberSection extends GetView<CreateNewOrderController> {
  const OrdersNumberSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: AppSize.height(20),
        bottom: AppSize.height(16),
      ),
      child: Row(
        children: [
          SizedBox(
            height: AppSize.height(29),
            width: AppSize.width(218),
            child: OrdersListView(),
          ),
          SizedBox(
            width: AppSize.width(28),
          ),
          AddOrderButton(),
        ],
      ),
    );
  }
}
