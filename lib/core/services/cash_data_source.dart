import 'package:get_storage/get_storage.dart';

class CashDataSource {
  final box = GetStorage();
  void saveAuthDetails(
    String userId,
    String token,
    String name,
    String tenantId,
    String companyId,
    String branchId,
    String? logo,
  ) {
    box.write('userId', userId);
    box.write('authToken', token);
    box.write('isAuthenticated', true);
    box.write('userName', name);
    box.write('tenantId', tenantId);
    box.write('companyId', companyId);
    box.write('branchId', branchId);
    box.write('logo', logo);
  }

  bool isAuthenticated() {
    return box.read('isAuthenticated') ?? false;
  }

  void logout() {
    box.erase();
  }

  // Save invoice data
  void saveInvoiceData({
    required String logo,
    required String commerce,
    required String cashierName,
    required String restaurantName,
    required String vatNumber,
    required String vat,
    required String mainAddress,
    required String websiteUrl,
  }) {
    box.write('invoice_logo', logo);
    box.write('invoice_commerce', commerce);
    box.write('invoice_cashier_name', cashierName);
    box.write('invoice_restaurant_name', restaurantName);
    box.write('invoice_vat_number', vatNumber);
    box.write('invoice_vat', vat);
    box.write('invoice_main_address', mainAddress);
    box.write('invoice_website_url', websiteUrl);
  }

  // Get invoice data
  Map<String, dynamic> getInvoiceData() {
    return {
      'logo': box.read('invoice_logo') ?? '',
      'commerce': box.read('invoice_commerce') ?? '',
      'cashierName': box.read('invoice_cashier_name') ?? 'Cashier',
      'restaurantName': box.read('invoice_restaurant_name') ?? 'Restaurant',
      'vatNumber': box.read('invoice_vat_number') ?? '0',
      'vat': box.read('invoice_vat') ?? '0',
      'mainAddress': box.read('invoice_main_address') ?? 'No Address',
      'websiteUrl': box.read('invoice_website_url') ?? 'Ahmed M. Okal',
    };
  }

  // Clear invoice data
  void clearInvoiceData() {
    box.remove('invoice_logo');
    box.remove('invoice_commerce');
    box.remove('invoice_cashier_name');
    box.remove('invoice_restaurant_name');
    box.remove('invoice_vat_number');
    box.remove('invoice_vat');
    box.remove('invoice_main_address');
    box.remove('invoice_website_url');
  }
}
