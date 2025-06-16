import 'dart:io';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrintersIPAddressController extends GetxController {
  static const String _printersKey = 'printer_ip_addresses';

  RxList<String> printerIPs = <String>[].obs;
  RxBool isLoading = false.obs;
  RxString testingIP = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadPrinterIPs();
  }

  /// Load saved printer IP addresses from SharedPreferences
  Future<void> loadPrinterIPs() async {
    try {
      isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final savedIPs = prefs.getStringList(_printersKey) ?? [];
      printerIPs.assignAll(savedIPs);
    } catch (e) {
      Get.snackbar(
        'خطأ - Error',
        'فشل في تحميل عناوين الطابعات - Failed to load printer addresses: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Save printer IP addresses to SharedPreferences
  Future<void> savePrinterIPs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_printersKey, printerIPs.toList());
      Get.snackbar(
        'نجح - Success',
        'تم حفظ عناوين الطابعات - Printer addresses saved',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'خطأ - Error',
        'فشل في حفظ عناوين الطابعات - Failed to save printer addresses: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Add a new printer IP address
  Future<void> addPrinterIP(String ipAddress) async {
    if (ipAddress.isEmpty) {
      Get.snackbar(
        'خطأ - Error',
        'يرجى إدخال عنوان IP صحيح - Please enter a valid IP address',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // if (!_isValidIP(ipAddress)) {
    //   Get.snackbar(
    //     'خطأ - Error',
    //     'عنوان IP غير صحيح - Invalid IP address format',
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    //   return;
    // }

    if (printerIPs.contains(ipAddress)) {
      Get.snackbar(
        'تحذير - Warning',
        'عنوان IP موجود بالفعل - IP address already exists',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Test connection before adding
    final isConnected = await testPrinterConnection(ipAddress);
    if (!isConnected) {
      Get.snackbar(
        'خطأ - Error',
        'فشل في الاتصال بالطابعة - Failed to connect to printer',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    printerIPs.add(ipAddress);
    await savePrinterIPs();
  }

  /// Remove a printer IP address
  Future<void> removePrinterIP(String ipAddress) async {
    printerIPs.remove(ipAddress);
    await savePrinterIPs();
  }

  /// Update a printer IP address
  Future<void> updatePrinterIP(String oldIP, String newIP) async {
    if (newIP.isEmpty || !_isValidIP(newIP)) {
      Get.snackbar(
        'خطأ - Error',
        'عنوان IP غير صحيح - Invalid IP address format',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (printerIPs.contains(newIP) && newIP != oldIP) {
      Get.snackbar(
        'تحذير - Warning',
        'عنوان IP موجود بالفعل - IP address already exists',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Test connection before updating
    final isConnected = await testPrinterConnection(newIP);
    if (!isConnected) {
      Get.snackbar(
        'خطأ - Error',
        'فشل في الاتصال بالطابعة - Failed to connect to printer',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final index = printerIPs.indexOf(oldIP);
    if (index != -1) {
      printerIPs[index] = newIP;
      await savePrinterIPs();
    }
  }

  /// Test connection to a printer
  Future<bool> testPrinterConnection(String ipAddress) async {
    testingIP.value = ipAddress;
    Socket? socket;

    try {
      // Try to connect to the printer (port 9100 is standard for thermal printers)
      socket = await Socket.connect(ipAddress, 9100,
          timeout: const Duration(seconds: 5));

      return true;
    } catch (e) {
      return false;
    } finally {
      testingIP.value = '';
      await socket?.close();
    }
  }

  /// Test all configured printers
  Future<Map<String, bool>> testAllPrinters() async {
    final Map<String, bool> results = {};

    for (String ip in printerIPs) {
      results[ip] = await testPrinterConnection(ip);
    }

    return results;
  }

  /// Clear all printer IP addresses
  Future<void> clearAllPrinters() async {
    printerIPs.clear();
    await savePrinterIPs();
  }

  /// Validate IP address format
  bool _isValidIP(String ip) {
    final RegExp ipRegExp = RegExp(
        r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
    return ipRegExp.hasMatch(ip);
  }

  /// Get printer count
  int get printerCount => printerIPs.length;

  /// Check if any printers are configured
  bool get hasPrinters => printerIPs.isNotEmpty;

  /// Get formatted printer list for display
  List<Map<String, dynamic>> get formattedPrinterList {
    return printerIPs.asMap().entries.map((entry) {
      return {
        'index': entry.key,
        'ip': entry.value,
        'name': 'Printer ${entry.key + 1}',
      };
    }).toList();
  }
}
