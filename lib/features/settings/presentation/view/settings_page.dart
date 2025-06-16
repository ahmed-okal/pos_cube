import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/controllers/printers_ip_address_controller.dart';

class SettingsPage extends GetView<PrintersIPAddressController> {
  // final ThemeService _themeService = Get.find<ThemeService>();

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PrintersIPAddressController controller =
        Get.find<PrintersIPAddressController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة الطابعات - Printer Management'),
        actions: [
          IconButton(
            onPressed: () => _showTestAllDialog(controller),
            icon: const Icon(Icons.network_check),
            tooltip: 'Test All Printers',
          ),
          IconButton(
            onPressed: () => _showClearAllDialog(controller),
            icon: const Icon(Icons.clear_all),
            tooltip: 'Clear All Printers',
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            // Add printer section
            _buildAddPrinterSection(controller),

            const Divider(),

            // Printers list
            Expanded(
              child: controller.printerIPs.isEmpty
                  ? _buildEmptyState()
                  : _buildPrintersList(controller),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPrinterDialog(controller),
        tooltip: 'Add Printer',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildAddPrinterSection(PrintersIPAddressController controller) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'الطابعات المكونة - Configured Printers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Obx(() => Text(
                'عدد الطابعات: ${controller.printerCount} - Total Printers: ${controller.printerCount}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.print_disabled,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'لا توجد طابعات مكونة',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'No printers configured',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () =>
                _showAddPrinterDialog(Get.find<PrintersIPAddressController>()),
            icon: const Icon(Icons.add),
            label: const Text('إضافة طابعة - Add Printer'),
          ),
        ],
      ),
    );
  }

  Widget _buildPrintersList(PrintersIPAddressController controller) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: controller.printerIPs.length,
      itemBuilder: (context, index) {
        final ip = controller.printerIPs[index];
        return _buildPrinterCard(controller, ip, index);
      },
    );
  }

  Widget _buildPrinterCard(
      PrintersIPAddressController controller, String ip, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            '${index + 1}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          'Printer ${index + 1}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'IP: $ip',
              style: const TextStyle(fontFamily: 'monospace'),
            ),
            Obx(() => controller.testingIP.value == ip
                ? const Row(
                    children: [
                      SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 8),
                      Text('Testing...', style: TextStyle(fontSize: 12)),
                    ],
                  )
                : const SizedBox.shrink()),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => _testSinglePrinter(controller, ip),
              icon: const Icon(Icons.network_check, color: Colors.green),
              tooltip: 'Test Connection',
            ),
            IconButton(
              onPressed: () => _showEditPrinterDialog(controller, ip),
              icon: const Icon(Icons.edit, color: Colors.blue),
              tooltip: 'Edit',
            ),
            IconButton(
              onPressed: () => _showDeleteConfirmation(controller, ip),
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }

  void _showAddPrinterDialog(PrintersIPAddressController controller) {
    final TextEditingController ipController = TextEditingController();

    Get.dialog(
      AlertDialog(
        title: const Text('إضافة طابعة جديدة - Add New Printer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: ipController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'عنوان IP - IP Address',
                hintText: '192.168.1.100',
                prefixIcon: Icon(Icons.wifi),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'تأكد من أن الطابعة متصلة بنفس الشبكة\nMake sure the printer is on the same network',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('إلغاء - Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final ip = ipController.text.trim();
              if (ip.isNotEmpty) {
                Get.back();
                await controller.addPrinterIP(ip);
              }
            },
            child: const Text('إضافة - Add'),
          ),
        ],
      ),
    );
  }

  void _showEditPrinterDialog(
      PrintersIPAddressController controller, String currentIP) {
    final TextEditingController ipController =
        TextEditingController(text: currentIP);

    Get.dialog(
      AlertDialog(
        title: const Text('تعديل الطابعة - Edit Printer'),
        content: TextField(
          controller: ipController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'عنوان IP - IP Address',
            hintText: '192.168.1.100',
            prefixIcon: Icon(Icons.wifi),
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('إلغاء - Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final newIP = ipController.text.trim();
              if (newIP.isNotEmpty && newIP != currentIP) {
                Get.back();
                await controller.updatePrinterIP(currentIP, newIP);
              } else {
                Get.back();
              }
            },
            child: const Text('حفظ - Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
      PrintersIPAddressController controller, String ip) {
    Get.dialog(
      AlertDialog(
        title: const Text('تأكيد الحذف - Confirm Delete'),
        content: Text(
            'هل تريد حذف الطابعة؟\nDo you want to delete this printer?\n\nIP: $ip'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('إلغاء - Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              await controller.removePrinterIP(ip);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف - Delete',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showClearAllDialog(PrintersIPAddressController controller) {
    if (controller.printerIPs.isEmpty) {
      Get.snackbar(
        'تحذير - Warning',
        'لا توجد طابعات لحذفها - No printers to delete',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.dialog(
      AlertDialog(
        title: const Text('حذف جميع الطابعات - Clear All Printers'),
        content: const Text(
            'هل تريد حذف جميع الطابعات؟\nDo you want to delete all printers?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('إلغاء - Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Get.back();
              await controller.clearAllPrinters();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف الكل - Delete All',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Future<void> _testSinglePrinter(
      PrintersIPAddressController controller, String ip) async {
    final isConnected = await controller.testPrinterConnection(ip);

    Get.snackbar(
      isConnected ? 'نجح - Success' : 'فشل - Failed',
      isConnected
          ? 'الطابعة متصلة - Printer connected: $ip'
          : 'فشل في الاتصال - Failed to connect: $ip',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isConnected ? Colors.green : Colors.red,
      colorText: Colors.white,
    );
  }

  void _showTestAllDialog(PrintersIPAddressController controller) async {
    if (controller.printerIPs.isEmpty) {
      Get.snackbar(
        'تحذير - Warning',
        'لا توجد طابعات للفحص - No printers to test',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Show loading dialog
    Get.dialog(
      const AlertDialog(
        title: Text('فحص الطابعات - Testing Printers'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('جاري فحص جميع الطابعات...\nTesting all printers...'),
          ],
        ),
      ),
      barrierDismissible: false,
    );

    try {
      final results = await controller.testAllPrinters();
      Get.back(); // Close loading dialog

      // Show results dialog
      Get.dialog(
        AlertDialog(
          title: const Text('نتائج الفحص - Test Results'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: results.entries.map((entry) {
              final ip = entry.key;
              final isConnected = entry.value;
              return ListTile(
                leading: Icon(
                  isConnected ? Icons.check_circle : Icons.error,
                  color: isConnected ? Colors.green : Colors.red,
                ),
                title: Text(ip),
                subtitle: Text(isConnected
                    ? 'متصل - Connected'
                    : 'غير متصل - Disconnected'),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text('موافق - OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      Get.back(); // Close loading dialog
      Get.snackbar(
        'خطأ - Error',
        'فشل في فحص الطابعات - Failed to test printers: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
