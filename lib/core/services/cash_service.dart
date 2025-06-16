import 'package:get_storage/get_storage.dart';

class CacheService {
  final GetStorage _storage = GetStorage();

  // Save data
  void write(String key, dynamic value) {
    _storage.write(key, value);
  }

  // Read data
  T? read<T>(String key) {
    return _storage.read<T>(key);
  }

  // Remove data
  void remove(String key) {
    _storage.remove(key);
  }

  // Check if key exists
  bool hasData(String key) {
    return _storage.hasData(key);
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
    _storage.write('invoice_logo', logo);
    _storage.write('invoice_commerce', commerce);
    _storage.write('invoice_cashier_name', cashierName);
    _storage.write('invoice_restaurant_name', restaurantName);
    _storage.write('invoice_vat_number', vatNumber);
    _storage.write('invoice_vat', vat);
    _storage.write('invoice_main_address', mainAddress);
    _storage.write('invoice_website_url', websiteUrl);
  }

  // Get invoice data
  Map<String, dynamic> getInvoiceData() {
    return {
      'logo': _storage.read('invoice_logo') ?? '',
      'commerce': _storage.read('invoice_commerce') ?? '',
      'cashierName': _storage.read('invoice_cashier_name') ?? 'Cashier',
      'restaurantName':
          _storage.read('invoice_restaurant_name') ?? 'Restaurant',
      'vatNumber': _storage.read('invoice_vat_number') ?? '0',
      'vat': _storage.read('invoice_vat') ?? '0',
      'mainAddress': _storage.read('invoice_main_address') ?? 'No Address',
      'websiteUrl': _storage.read('invoice_website_url') ?? 'Ahmed M. Okal',
    };
  }

  // Clear invoice data
  void clearInvoiceData() {
    _storage.remove('invoice_logo');
    _storage.remove('invoice_commerce');
    _storage.remove('invoice_cashier_name');
    _storage.remove('invoice_restaurant_name');
    _storage.remove('invoice_vat_number');
    _storage.remove('invoice_vat');
    _storage.remove('invoice_main_address');
    _storage.remove('invoice_website_url');
  }
}
