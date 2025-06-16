import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/features/print/presentation/getx/controllers/print_controller.dart';

class InvoicePaymentMethods extends GetView<PrintController> {
  const InvoicePaymentMethods({
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
                      .data?.paymentTransactions?.length ??
                  0,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller
                              .orderDetailsController
                              .orderDetailsModel
                              .data
                              ?.paymentTransactions?[index]
                              .paymentMethod
                              ?.description?[0]
                              .name ??
                          '',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      controller.orderDetailsController.orderDetailsModel.data
                              ?.paymentTransactions?[index].amount ??
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
