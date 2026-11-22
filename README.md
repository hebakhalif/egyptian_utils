# Egyptian Utils

A lightweight and practical Dart utility package providing helpful extensions for Egyptian developers and applications targeting Egyptian users.

## Features

- **Arabic Numerals Conversion**: Easily convert Western digits (`0-9`) into Eastern Arabic numerals (`٠-٩`) in any string.
- **Egyptian Mobile Phone Validation & Formatting**:
  - Validate mobile numbers for all major Egyptian carriers (Vodafone `010`, Etisalat `011`, Orange `012`, WE `015`).
  - Supports local and international formats (`+20`, `0020`, `20`).
  - Format phone numbers cleanly into readable formats (e.g. `010 123 45678`).
- **Currency Formatting**: Format numbers into localized currency representations with custom symbols, locales, and currency codes (defaults to Egyptian Pounds `EGP`).

---

## Getting Started

Add `egyptian_utils` to your `pubspec.yaml` dependencies:

```bash
dart pub add egyptian_utils
```

Or for Flutter projects:

```bash
flutter pub add egyptian_utils
```

Then import the package in your Dart code:

```dart
import 'package:egyptian_utils/egyptian_utils.dart';
```

---

## Usage

### 1. Convert Digits to Arabic Numerals

Use the `.toArabicNumbers()` extension on any `String`:

```dart
import 'package:egyptian_utils/egyptian_utils.dart';

void main() {
  String message = "Order #150 placed on 22/11/2026";
  print(message.toArabicNumbers());
  // Output: Order #١٥٠ placed on ٢٢/١١/٢٠٢٦
}
```

---

### 2. Egyptian Phone Validation & Formatting

Easily validate and format Egyptian phone numbers:

```dart
import 'package:egyptian_utils/egyptian_utils.dart';

void main() {
  String phone = "+201012345678";

  // Check validity
  if (phone.isValidEgyptianPhone()) {
    print("Valid Egyptian phone number!");
  }

  // Convenient getter
  print(phone.isEgyptianPhone); // true

  // Format into a readable style: 01X XXX XXXXX
  print(phone.formatEgyptianPhone());
  // Output: 010 123 45678
}
```

**Supported prefixes**:
- Vodafone: `010`
- Etisalat: `011`
- Orange: `012`
- WE: `015`
- International codes: `+20`, `0020`, `20`

---

### 3. Currency Formatting

Format numbers as localized currency strings:

```dart
import 'package:egyptian_utils/egyptian_utils.dart';

void main() {
  num price = 1500;

  // Default: Egyptian Pounds (ar_EG, EGP)
  print(price.toCurrency());
  // Output: ١٬٥٠٠٫٠٠ EGP

  // Format in US Dollars
  print(price.toCurrency(currencyCode: 'USD', locale: 'en_US'));
  // Output: USD1,500.00
}
```

---

## Running Tests

To run the automated tests:

```bash
dart test
```

---

## License

This project is licensed under the MIT License - see the LICENSE file for details.
