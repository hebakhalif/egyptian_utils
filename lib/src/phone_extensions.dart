/// Utilities for validating and formatting Egyptian mobile phone numbers.
extension EgyptianPhoneExtensions on String {
  /// Regular expression to match Egyptian mobile phone numbers.
  /// Supported formats:
  /// - Local: 010..., 011..., 012..., 015... (11 digits)
  /// - International: +2010..., 002010..., +20010...
  static final RegExp _egyptianPhoneRegex = RegExp(
    r'^(?:(?:\+?20|0020)\s?0?|0)(1[0125][0-9]{8})$',
  );

  /// Checks whether this string is a valid Egyptian mobile phone number.
  bool isValidEgyptianPhone() => _egyptianPhoneRegex.hasMatch(trim());

  /// Convenient getter alias for [isValidEgyptianPhone].
  bool get isEgyptianPhone => isValidEgyptianPhone();

  /// Formats a valid Egyptian mobile phone number into readable format: `01X XXX XXXXX`.
  ///
  /// If the string is not a valid Egyptian phone number, the original string
  /// is returned without modification.
  String formatEgyptianPhone() {
    final match = _egyptianPhoneRegex.firstMatch(trim());
    if (match == null) return this;
    final number = match.group(1)!; // e.g. 1012345678
    return '0${number.substring(0, 2)} ${number.substring(2, 5)} ${number.substring(5)}';
  }
}
