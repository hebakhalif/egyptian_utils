import 'package:egyptian_utils/egyptian_utils.dart';
import 'package:test/test.dart';

void main() {
  group('ArabicNumbers Extension', () {
    test('converts English digits to Arabic digits', () {
      expect('1234567890'.toArabicNumbers(), '١٢٣٤٥٦٧٨٩٠');
      expect('Price: 150 EGP'.toArabicNumbers(), 'Price: ١٥٠ EGP');
    });

    test('leaves non-numeric text unchanged', () {
      expect('Hello World'.toArabicNumbers(), 'Hello World');
    });
  });

  group('Currency Extension', () {
    test('formats numbers as currency correctly', () {
      final formatted = 1500.toCurrency(currencyCode: 'USD', locale: 'en_US');
      expect(formatted, contains('1,500'));
    });
  });

  group('EgyptianPhoneExtensions', () {
    test('validates correct Egyptian mobile numbers', () {
      expect('01012345678'.isValidEgyptianPhone(), isTrue);
      expect('01112345678'.isValidEgyptianPhone(), isTrue);
      expect('01212345678'.isValidEgyptianPhone(), isTrue);
      expect('01512345678'.isValidEgyptianPhone(), isTrue);
      expect('+201012345678'.isValidEgyptianPhone(), isTrue);
      expect('00201112345678'.isValidEgyptianPhone(), isTrue);
    });

    test('rejects invalid phone numbers', () {
      expect('01312345678'.isValidEgyptianPhone(), isFalse); // Landline prefix
      expect('123456'.isValidEgyptianPhone(), isFalse);      // Too short
      expect('0101234567'.isValidEgyptianPhone(), isFalse);  // Missing digit
      expect('010123456789'.isValidEgyptianPhone(), isFalse);// Extra digit
    });

    test('formats Egyptian mobile numbers with spaces', () {
      expect('01012345678'.formatEgyptianPhone(), '010 123 45678');
    });
  });
}
