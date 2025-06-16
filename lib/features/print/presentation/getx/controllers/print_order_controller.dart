import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sale/core/services/cash_data_source.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_controller.dart';
import 'package:point_of_sale/features/home/presentation/getx/controllers/order_details_controller.dart';
import 'package:point_of_sale/features/print/presentation/getx/controllers/print_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../settings/presentation/getx/controllers/printers_ip_address_controller.dart';

class PrintOrderController extends GetxController {
  final PrintersIPAddressController printersController =
      Get.find<PrintersIPAddressController>();
  final OrderController orderController = Get.find<OrderController>();

  final GlobalKey invoiceKey = GlobalKey();
  RxBool isPrinting = false.obs;
  RxString printStatus = ''.obs;

  /// Creates the invoice widget that will be captured as image
  Widget buildInvoiceWidget(PrintController controller) {
    return FutureBuilder<InvoiceData>(
      future: _getInvoiceData(controller),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data!;
        return RepaintBoundary(
          key: invoiceKey,
          child: Container(
            width: 300, // 80mm width approximately
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                if (data.logoBytes != null)
                  Image.memory(
                    data.logoBytes!,
                    width: 150,
                    height: 100,
                    fit: BoxFit.contain,
                  ),

                const SizedBox(height: 16),

                // Restaurant name and invoice type
                Text(
                  data.restaurantName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'فاتورة ضريبية مبسطة',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Simplified Tax Invoice',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Order number
                Text(
                  'Order #${data.invoiceNumber}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // Invoice details table
                _buildInvoiceDetailsTable(data),

                const Divider(thickness: 2),

                // Items header
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Qty\nالكمية',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Text('Item\nالصنف',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    Text('Price\nالسعر',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ],
                ),

                const Divider(),

                // Items list
                ...data.items.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.qty),
                          Expanded(
                            child: Text(
                              item.productName,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text('${item.totalPrice} SR'),
                        ],
                      ),
                    )),

                const Divider(thickness: 2),

                // Totals
                _buildTotalsSection(data),

                const SizedBox(height: 16),

                // Payment methods
                ...data.paymentTransactions.map((payment) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${payment.methodNameAr} ${payment.methodNameEn}'),
                          Text('${payment.amount} SR'),
                        ],
                      ),
                    )),

                const SizedBox(height: 16),

                // QR Code
                if (data.qrCodeBytes != null)
                  Image.memory(
                    data.qrCodeBytes!,
                    width: 120,
                    height: 120,
                  ),

                const SizedBox(height: 16),

                // Footer
                Text(
                  'Powered by ${data.websiteUrl}',
                  style: const TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInvoiceDetailsTable(InvoiceData data) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(3),
        2: FlexColumnWidth(2),
      },
      children: [
        _buildTableRow('VAT', data.vatNumber, 'الرقم الضريبي'),
        _buildTableRow('C.R', data.commerce, 'السجل التجاري'),
        _buildTableRow('POS', data.mainAddress, 'نقطة البيع'),
        _buildTableRow('Cashier', data.cashierName, 'الكاشير'),
        _buildTableRow('Date', data.formattedDate, 'التاريخ'),
      ],
    );
  }

  TableRow _buildTableRow(String labelEn, String value, String labelAr) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(labelEn, style: const TextStyle(fontSize: 10)),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(value,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(labelAr,
              style: const TextStyle(fontSize: 10), textAlign: TextAlign.right),
        ),
      ],
    );
  }

  Widget _buildTotalsSection(InvoiceData data) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('المجموع بدون الضريبة - Subtotal',
                style: TextStyle(fontSize: 10)),
            Text('${data.subtotal} SR',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('%(${data.vat}) الضريبة - VAT',
                style: const TextStyle(fontSize: 10)),
            Text('${data.vatAmount} SR',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('الإجمالي شامل الضريبة - Total including VAT',
                style: TextStyle(fontSize: 10)),
            Text('${data.totalIncludingVat} SR',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }

  /// Captures the invoice widget as image and prints to all configured printers
  Future<void> printInvoiceToWiFiPrinters(PrintController controller) async {
    if (printersController.printerIPs.isEmpty) {
      Get.snackbar(
        'خطأ - Error',
        'لا توجد طابعات مكونة - No printers configured',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isPrinting.value = true;
    printStatus.value = 'جاري التحضير - Preparing...';

    try {
      // Capture the invoice widget as image
      final Uint8List imageBytes = await _captureInvoiceAsImage();

      // Convert to ESC/POS commands
      final List<int> escPosCommands = await _convertImageToESCPOS(imageBytes);

      // Print to all configured printers simultaneously
      final List<Future<void>> printTasks =
          printersController.printerIPs.map((ip) {
        return _printToWiFiPrinter(ip, escPosCommands);
      }).toList();

      printStatus.value = 'جاري الطباعة - Printing...';
      await Future.wait(printTasks);

      printStatus.value = 'تمت الطباعة بنجاح - Print completed successfully';
      Get.snackbar(
        'نجح - Success',
        'تمت طباعة الفاتورة على جميع الطابعات - Invoice printed to all printers',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      printStatus.value = 'فشل في الطباعة - Print failed';
      Get.snackbar(
        'خطأ - Error',
        'فشل في طباعة الفاتورة - Failed to print invoice: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isPrinting.value = false;
      Future.delayed(const Duration(seconds: 3), () {
        printStatus.value = '';
      });
    }
  }

  /// Captures the invoice widget as image bytes
  Future<Uint8List> _captureInvoiceAsImage() async {
    final RenderRepaintBoundary boundary =
        invoiceKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage(pixelRatio: 2.0);
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  }

  /// Converts image to ESC/POS commands for thermal printers
  Future<List<int>> _convertImageToESCPOS(Uint8List imageBytes) async {
    List<int> commands = [];

    // ESC/POS initialization commands
    commands.addAll([27, 64]); // ESC @ - Initialize printer
    commands.addAll([27, 97, 1]); // ESC a 1 - Center alignment

    // For now, we'll use a simple approach
    // In a real implementation, you would convert the image to bitmap
    // and use ESC/POS image printing commands

    // This is a simplified version - you might want to use a library like 'esc_pos_utils'
    // for proper image conversion

    // Add paper cut command
    commands.addAll([29, 86, 48]); // GS V 0 - Full cut

    return commands;
  }

  /// Prints ESC/POS commands to a specific WiFi printer
  Future<void> _printToWiFiPrinter(String ipAddress, List<int> commands) async {
    Socket? socket;
    try {
      // Connect to printer (default port 9100 for most thermal printers)
      socket = await Socket.connect(ipAddress, 9100,
          timeout: const Duration(seconds: 5));

      // Send commands to printer
      socket.add(commands);
      await socket.flush();

      // Wait a bit for printing to complete
      await Future.delayed(const Duration(seconds: 2));
    } catch (e) {
      throw Exception('Failed to print to $ipAddress: $e');
    } finally {
      await socket?.close();
    }
  }

  /// Gets all invoice data needed for printing
  Future<InvoiceData> _getInvoiceData(PrintController controller) async {
    final cashDataSource = Get.find<CashDataSource>();
    final invoiceData = cashDataSource.getInvoiceData();
    final orderDetailsController = Get.find<OrderDetailsController>();

    final logoUrl = invoiceData['logo'] as String;
    final commerce = invoiceData['commerce'] as String;
    final cashierName = invoiceData['cashierName'] as String;
    final restaurantName = invoiceData['restaurantName'] as String;
    final vatNumber = invoiceData['vatNumber'] as String;
    final vat = invoiceData['vat'] as String;
    final mainAddress = invoiceData['mainAddress'] as String;
    final websiteUrl = invoiceData['websiteUrl'] as String;

    final invoiceNumber = controller.orderNumber.toString();
    final double subtotal = double.parse(controller.totalPrice.toString());
    final double vatAmount = subtotal * (double.parse(vat) / 100);
    final double totalIncludingVat = subtotal + vatAmount;

    // Load logo if available
    Uint8List? logoBytes;
    if (logoUrl.isNotEmpty) {
      try {
        logoBytes = await _fetchLogoBytes(logoUrl);
      } catch (_) {
        logoBytes = null;
      }
    }

    // Generate QR code
    Uint8List? qrCodeBytes;
    try {
      final qrData = await QrPainter(
        data: websiteUrl,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.M,
      ).toImageData(300);
      qrCodeBytes = qrData?.buffer.asUint8List();
    } catch (_) {
      qrCodeBytes = null;
    }

    // Get items
    final items = orderDetailsController.orderDetailsModel.data?.items
            ?.map((item) => InvoiceItem(
                  qty: item.qty ?? '0',
                  productName: item.productName ?? '',
                  totalPrice: item.totalPrice ?? '0.00',
                ))
            .toList() ??
        [];

    // Get payment transactions
    final paymentTransactions =
        orderDetailsController.orderDetailsModel.data?.paymentTransactions
                ?.map((payment) => PaymentTransaction(
                      methodNameAr:
                          payment.paymentMethod?.description?[1].name ?? '',
                      methodNameEn:
                          payment.paymentMethod?.description?[0].name ?? '',
                      amount: payment.amount ?? '',
                    ))
                .toList() ??
            [];

    return InvoiceData(
      logoBytes: logoBytes,
      restaurantName: restaurantName,
      invoiceNumber: invoiceNumber,
      vatNumber: vatNumber,
      commerce: commerce,
      mainAddress: mainAddress,
      cashierName: cashierName,
      formattedDate: DateFormat('yyyy/MM/dd hh:mm a').format(DateTime.now()),
      subtotal: subtotal.toStringAsFixed(2),
      vat: vat,
      vatAmount: vatAmount.toStringAsFixed(2),
      totalIncludingVat: totalIncludingVat.toStringAsFixed(2),
      websiteUrl: websiteUrl,
      qrCodeBytes: qrCodeBytes,
      items: items,
      paymentTransactions: paymentTransactions,
    );
  }

  /// Fetches logo bytes from URL
  Future<Uint8List> _fetchLogoBytes(String url) async {
    try {
      final File file = await DefaultCacheManager().getSingleFile(url);
      return await file.readAsBytes();
    } catch (err) {
      throw Exception('Failed to load logo: $err');
    }
  }
}

// Data classes
class InvoiceData {
  final Uint8List? logoBytes;
  final String restaurantName;
  final String invoiceNumber;
  final String vatNumber;
  final String commerce;
  final String mainAddress;
  final String cashierName;
  final String formattedDate;
  final String subtotal;
  final String vat;
  final String vatAmount;
  final String totalIncludingVat;
  final String websiteUrl;
  final Uint8List? qrCodeBytes;
  final List<InvoiceItem> items;
  final List<PaymentTransaction> paymentTransactions;

  InvoiceData({
    this.logoBytes,
    required this.restaurantName,
    required this.invoiceNumber,
    required this.vatNumber,
    required this.commerce,
    required this.mainAddress,
    required this.cashierName,
    required this.formattedDate,
    required this.subtotal,
    required this.vat,
    required this.vatAmount,
    required this.totalIncludingVat,
    required this.websiteUrl,
    this.qrCodeBytes,
    required this.items,
    required this.paymentTransactions,
  });
}

class InvoiceItem {
  final String qty;
  final String productName;
  final String totalPrice;

  InvoiceItem({
    required this.qty,
    required this.productName,
    required this.totalPrice,
  });
}

class PaymentTransaction {
  final String methodNameAr;
  final String methodNameEn;
  final String amount;

  PaymentTransaction({
    required this.methodNameAr,
    required this.methodNameEn,
    required this.amount,
  });
}
