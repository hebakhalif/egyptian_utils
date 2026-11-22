import 'package:intl/intl.dart';

/// Extension on [num] to format numeric values as currency strings.
extension ExtensionCurrency on num {
  /// Formats this number into a localized currency string.
  ///
  /// Parameters:
  /// * [locale] - The locale to use for formatting (defaults to 'ar_EG').
  /// * [currencyCode] - ISO-4217 currency code (e.g. 'EGP', 'USD', 'EUR').
  /// * [symbol] - Optional custom currency symbol override (e.g. 'م.ج' or 'EGP').
  ///
  /// Example:
  /// ```dart
  /// 1500.toCurrency(locale: 'ar_EG', currencyCode: 'EGP');
  /// // => "١٬٥٠٠٫٠٠ EGP"
  /// ```
  String toCurrency({
    String locale = 'ar_EG',
    String? currencyCode = 'EGP',
    String? symbol,
  }) {
    final format = NumberFormat.currency(
      locale: locale,
      name: currencyCode,
      symbol: symbol,
    );
    return format.format(this);
  }
}
