import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sale/core/utils/app_assets.dart';
import 'package:point_of_sale/core/utils/app_text_style.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../getx/controllers/print_controller.dart';

class InvoiceHeader extends GetView<PrintController> {
  final String orderNumber;

  const InvoiceHeader({
    super.key,
    required this.orderNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.logoPOSUBE,
          height: 80,
        ),
        QrImageView(
          data: '01068609852',
          version: QrVersions.auto,
          size: 150,
        ),
        const SizedBox(height: 16),
        Text(
          'Business Cube SA',
          style: AppTextStyle.primary18800.copyWith(
            fontSize: 20,
          ),
        ),
        Text(
          'm.shahin@business-cube.sa',
          style: AppTextStyle.primary16800.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Text(
          orderNumber,
          style: AppTextStyle.primary53800.copyWith(
            fontSize: 48,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
