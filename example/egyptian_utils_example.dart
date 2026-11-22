import 'package:egyptian_utils/egyptian_utils.dart';

void main() {
  print('--- 1. Convert English Digits to Arabic Digits ---');
  String text = 'Order #150 placed on 22/11/2026';
  print('Original text: $text');
  print('With Arabic digits: ${text.toArabicNumbers()}');
  // Output: Order #١٥٠ placed on ٢٢/١١/٢٠٢٦

  print('\n--- 2. Currency Formatting ---');
  num price = 1500;
  // Default Egyptian formatting
  print('Egyptian Pounds: ${price.toCurrency(currencyCode: 'EGP', locale: 'ar_EG')}');
  // US Dollars formatting
  print('US Dollars: ${price.toCurrency(currencyCode: 'USD', locale: 'en_US')}');

  print('\n--- 3. Egyptian Phone Validation & Formatting ---');
  List<String> phones = [
    '01012345678',   // Vodafone (valid)
    '01123456789',   // Etisalat (valid)
    '01234567890',   // Orange (valid)
    '01512345678',   // WE (valid)
    '+201012345678', // International prefix (valid)
    '01312345678',   // Invalid prefix (013 is landline)
    '123456',        // Invalid (too short)
  ];

  for (var phone in phones) {
    bool isValid = phone.isValidEgyptianPhone();
    String formatted = phone.formatEgyptianPhone();
    print('$phone -> Valid: $isValid | Formatted: $formatted');
  }
}
