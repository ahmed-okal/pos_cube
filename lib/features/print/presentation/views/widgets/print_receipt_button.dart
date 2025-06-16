import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:point_of_sale/core/utils/size_utils.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/print_controller.dart';
import '../../getx/controllers/print_order_controller.dart';

class PrintReceiptButton extends GetView<PrintController> {
  const PrintReceiptButton({super.key});

  @override
  Widget build(BuildContext context) {
    final printOrderController = Get.put(PrintOrderController());

    return InkWell(
      onTap: () async {
        await printOrderController.printInvoiceToWiFiPrinters(controller);
      },
      child: Container(
        height: AppSize.height(39),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: AppColors.primaryWithOpacity,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.print,
              size: getSize(24),
              color: AppColors.primaryColor,
            ),
            SizedBox(width: AppSize.width(12)),
            Text(
              'printFullReceipt'.tr,
              style: AppTextStyle.primary18800,
            ),
          ],
        ),
      ),
    );
  }
}
