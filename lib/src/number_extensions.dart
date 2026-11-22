import 'package:characters/characters.dart';

/// Extension on [String] to provide Arabic digits conversion.
extension ArabicNumbers on String {
  /// Converts all English digits (0-9) in the string to Eastern Arabic numerals (٠-٩).
  /// Any non-digit characters are preserved as they are.
  String toArabicNumbers() {
    // Mapping of index 0-9 to the corresponding Eastern Arabic numeral
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    final buffer = StringBuffer();

    // Iterate through characters safely using the characters package
    for (var ch in characters) {
      final digit = int.tryParse(ch);
      if (digit != null) {
        // Replace digit with its Arabic counterpart
        buffer.write(arabic[digit]);
      } else {
        // Keep non-numeric characters untouched
        buffer.write(ch);
      }
    }
    return buffer.toString();
  }
}
