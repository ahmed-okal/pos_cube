import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sale/core/utils/app_colors.dart';
import 'package:point_of_sale/features/print/presentation/getx/controllers/print_controller.dart';
import 'package:point_of_sale/features/print/presentation/views/widgets/app_bar_widget.dart';
import 'package:point_of_sale/features/print/presentation/views/widgets/new_order_button.dart';
import 'package:point_of_sale/features/print/presentation/views/widgets/payment_success_box.dart';
import 'package:point_of_sale/features/print/presentation/views/widgets/print_receipt_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/services/cash_data_source.dart';
import '../../../../core/utils/size_config.dart';
import '../../../home/presentation/views/widgets/custom_drawer.dart';

class PrintView extends GetView<PrintController> {
  const PrintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrintAppBar(),
      drawer: Drawer(
        backgroundColor: AppColors.white,
        width: AppSize.width(372),
        child: const CustomDrawer(),
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left side: Payment Success + Print Receipt
            Container(
              width: AppSize.width(425),
              color: AppColors.lightGreen,
              padding: EdgeInsetsDirectional.only(
                top: AppSize.height(41),
                start: AppSize.width(24),
                end: AppSize.width(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PaymentSuccessBox(),
                  SizedBox(height: AppSize.height(21)),
                  const PrintReceiptButton(),
                  const Spacer(),
                  NewOrderButton(),
                  SizedBox(height: AppSize.height(42)),
                ],
              ),
            ),

            // Right side: Invoice
            Expanded(
              child: Container(
                color: Colors.grey.shade100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 20,
                ),
                child: Center(
                  child: Invoice(controller: controller),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Invoice extends StatelessWidget {
  const Invoice({
    super.key,
    required this.controller,
  });

  final PrintController controller;

  @override
  Widget build(BuildContext context) {
    final cashDataSource = Get.find<CashDataSource>();
    final invoiceData = cashDataSource.getInvoiceData();
    final logoUrl = invoiceData['logo'] as String;
    final commerce = invoiceData['commerce'] as String;
    final cashierName = invoiceData['cashierName'] as String;
    final restaurntName = invoiceData['restaurantName'] as String;
    final vatNumber = invoiceData['vatNumber'] as String;
    final vat = invoiceData['vat'] as String;
    final mainAddress = invoiceData['mainAddress'] as String;
    final websiteUrl = invoiceData['websiteUrl'] as String;
    final invoiceNumber = controller.orderNumber.toString();

    // final double subtotal = controller.totalPrice;
    // final double vatAmount = subtotal * (double.parse(vat) / 100);
    // final double totalIncludingVat = subtotal + vatAmount;

    return Container(
      width: 302,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Logo
            if (logoUrl.isNotEmpty)
              Center(
                child: Image.network(
                  logoUrl,
                  width: 200,
                  height: 150,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
              ),

            if (logoUrl.isNotEmpty) const SizedBox(height: 10),
            const SizedBox(height: 25),

            // Restaurant Name and Invoice Title
            InvoiceTitle(
              restaurantName: restaurntName,
              fontSize: 8,
            ),

            // Invoice Number
            InvoiceNumberBox(
              invoiceNumber: invoiceNumber,
              fontSize: 16,
            ),
            const SizedBox(height: 8),

            // Company Info Table
            CompanyInfoTable(
              vatNumber: vatNumber,
              commerce: commerce,
              mainAddress: mainAddress,
              cashierName: cashierName,
              fontSize: 8,
            ),

            const Divider(),

            // Column Headers
            InvoiceColumnHeaders(fontSize: 10),
            const Divider(),

            // Order Items
            Obx(() {
              final items = controller
                      .orderDetailsController.orderDetailsModel.data?.items ??
                  [];
              if (controller.orderDetailsController.loading.isTrue) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: items
                    .map((item) => InvoiceItemRow(
                          quantity: item.qty ?? '0',
                          name: item.productName ?? '',
                          price: '${item.totalPrice ?? '0.00'} ${'SR'.tr}',
                          fontSize: 10,
                        ))
                    .toList(),
              );
            }),

            const Divider(thickness: 1),

            // Totals
            InvoiceTotalRow(
              label: 'المجموع بدون الضريبة - Subtotal',
              value: '${controller.totalPrice.toStringAsFixed(2)} SR',
              labelFontSize: 6,
              valueFontSize: 8,
            ),
            InvoiceTotalRow(
              label: '%($vat) الضريبة - VAT',
              value:
                  '${(controller.totalPrice * double.parse(vat) / 100).toStringAsFixed(2)} SR',
              labelFontSize: 6,
              valueFontSize: 8,
            ),
            InvoiceTotalRow(
              label: 'الإجمالي شامل الضريبة - Total including VAT',
              value:
                  '${(controller.totalPrice + (controller.totalPrice * double.parse(vat) / 100)).toStringAsFixed(2)} SR',
              labelFontSize: 6,
              valueFontSize: 10,
            ),
            const Divider(),
            const SizedBox(height: 3),

            // Payment Methods
            Obx(
              () => controller.orderDetailsController.loading.isTrue
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller
                              .orderDetailsController
                              .orderDetailsModel
                              .data
                              ?.paymentTransactions
                              ?.length ??
                          0,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.orderDetailsController.orderDetailsModel.data?.paymentTransactions?[index].paymentMethod?.description?[1].name ?? ''} ${controller.orderDetailsController.orderDetailsModel.data?.paymentTransactions?[index].paymentMethod?.description?[0].name ?? ''}',
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              '${controller.orderDetailsController.orderDetailsModel.data?.paymentTransactions?[index].amount ?? ''} ${'SR'.tr}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                          ],
                        );
                      },
                    ),
            ),

            const SizedBox(height: 15),

            // QR Code
            if (websiteUrl.isNotEmpty)
              Center(
                child: QrImageView(
                  data: websiteUrl,
                  version: QrVersions.auto,
                  size: 150,
                ),
              ),

            const SizedBox(height: 5),

            // Footer
            Center(
              child: Text(
                'Powered by $websiteUrl',
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InvoiceTitle extends StatelessWidget {
  const InvoiceTitle({
    super.key,
    required this.restaurantName,
    required this.fontSize,
  });

  final String restaurantName;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          restaurantName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          'فاتورة ضريبية مبسطة',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Simplified Tax Invoice',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class InvoiceNumberBox extends StatelessWidget {
  const InvoiceNumberBox({
    super.key,
    required this.invoiceNumber,
    required this.fontSize,
  });

  final String invoiceNumber;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Order #${invoiceNumber.trim()}',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CompanyInfoTable extends StatelessWidget {
  const CompanyInfoTable({
    super.key,
    required this.vatNumber,
    required this.commerce,
    required this.mainAddress,
    required this.cashierName,
    required this.fontSize,
  });

  final String vatNumber;
  final String commerce;
  final String mainAddress;
  final String cashierName;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(4),
        2: FlexColumnWidth(3),
      },
      children: [
        _buildTableRow('VAT', vatNumber, 'الرقم الضريبي', fontSize),
        _buildTableRow('C.R', commerce, 'السجل التجاري', fontSize),
        _buildTableRow('POS', mainAddress, 'نقطة البيع', fontSize),
        _buildTableRow('Cashier', cashierName, 'الكاشير', fontSize),
        _buildTableRow(
          'Date',
          DateFormat('yyyy/MM/dd hh:mm a').format(DateTime.now()),
          'التاريخ',
          fontSize,
        ),
      ],
    );
  }

  TableRow _buildTableRow(
      String english, String value, String arabic, double fontSize) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Text(
            english,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            arabic,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class InvoiceColumnHeaders extends StatelessWidget {
  const InvoiceColumnHeaders({
    super.key,
    required this.fontSize,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildColumn('Qty', 'الكمية', fontSize),
        _buildColumn('Item', 'الصنف', fontSize),
        _buildColumn('Price', 'السعر', fontSize),
      ],
    );
  }

  Widget _buildColumn(String english, String arabic, double fontSize) {
    return Column(
      children: [
        Text(
          english,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          arabic,
          style: TextStyle(
            fontSize: fontSize - 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class InvoiceItemRow extends StatelessWidget {
  const InvoiceItemRow({
    super.key,
    required this.quantity,
    required this.name,
    required this.price,
    required this.fontSize,
  });

  final String quantity;
  final String name;
  final String price;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          quantity,
          style: TextStyle(fontSize: fontSize),
        ),
        Text(
          name,
          style: TextStyle(fontSize: fontSize),
        ),
        Text(
          price,
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}

class InvoiceTotalRow extends StatelessWidget {
  const InvoiceTotalRow({
    super.key,
    required this.label,
    required this.value,
    required this.labelFontSize,
    required this.valueFontSize,
  });

  final String label;
  final String value;
  final double labelFontSize;
  final double valueFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: labelFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: valueFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
