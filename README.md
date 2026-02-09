# countrydialselector

A lightweight and customizable Flutter package for selecting country phone dial codes using a smooth wheel-style picker.

Built to be simple, flexible, and easy to integrate into any Flutter application.

---

## ✨ Features

- 🎡 Smooth wheel-style country dial code selector
- 🌍 Built-in list of common countries and dial codes
- 🎯 Supports initial country selection
- 🎨 Fully customizable colors (selected, unselected, border)
- 🧩 Strongly typed API using `CountryData`
- 📦 Lightweight and package-friendly
- 🔌 Supports custom country lists

## 🚀 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  countrydialselector: ^0.0.3
````

Then run:

```bash
flutter pub get
```

---

## 📦 Import

```dart
import 'package:countrydialselector/countrydialselector.dart';
```

---

## 🧑‍💻 Basic Usage

```dart
CountryPickerWheel(
  initialCountry: const CountryData(
    name: 'Nigeria',
    dialCode: '+234',
  ),
  selectedTextColor: Colors.green,
  unselectedTextColor: Colors.grey,
  borderColor: Colors.green,
  onSelected: (country) {
    debugPrint('${country.name} → ${country.dialCode}');
  },
)
```

---

## 🎨 Customization

```dart
CountryPickerWheel(
  selectedTextColor: Colors.blue,
  unselectedTextColor: Colors.black45,
  borderColor: Colors.blue,
  height: 240,
  itemExtent: 60,
  onSelected: (country) {},
)
```

---

## 🌍 Using a Custom Country List

```dart
CountryPickerWheel(
  countries: const [
    CountryData(name: 'Ghana', dialCode: '+233'),
    CountryData(name: 'Kenya', dialCode: '+254'),
    CountryData(name: 'Egypt', dialCode: '+20'),
  ],
  onSelected: (country) {
    print(country.dialCode);
  },
)
```

---

## 📚 API Reference

### CountryPickerWheel

| Property              | Type                        | Description                     |
| --------------------- | --------------------------- | ------------------------------- |
| `countries`           | `List<CountryData>`         | List of countries to display    |
| `initialCountry`      | `CountryData?`              | Country selected initially      |
| `onSelected`          | `ValueChanged<CountryData>` | Callback when selection changes |
| `selectedTextColor`   | `Color`                     | Color of selected item          |
| `unselectedTextColor` | `Color`                     | Color of unselected items       |
| `borderColor`         | `Color`                     | Highlight border color          |
| `height`              | `double`                    | Height of the picker wheel      |
| `itemExtent`          | `double`                    | Height of each wheel item       |

---

### CountryData

```dart
class CountryData {
  final String name;
  final String dialCode;

  const CountryData({
    required this.name,
    required this.dialCode,
  });
}
```

---


## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create a feature branch
3. Submit a pull request

---

## 📄 License

This project is licensed under the **MIT License**.

---

## Author

**Ridwan Abdulazeez**

If you find this package useful, please ⭐ the repository and share feedback!

````

