import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/print/presentation/getx/controllers/print_controller.dart';

class InvoiceItemsList extends GetView<PrintController> {
  const InvoiceItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.orderDetailsController.loading.isTrue
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              shrinkWrap: true,
              itemCount: controller.orderDetailsController.orderDetailsModel
                      .data?.items?.length ??
                  0,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        '${controller.orderDetailsController.orderDetailsModel.data?.items?[index].qty} ${controller.orderDetailsController.orderDetailsModel.data?.items?[index].productName ?? ''}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Text(
                      controller.orderDetailsController.orderDetailsModel.data
                              ?.items?[index].totalPrice ??
                          '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
