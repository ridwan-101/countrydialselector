class CountryData {
  final String name;
  final String dialCode;

  const CountryData({required this.name, required this.dialCode});
}

const List<CountryData> defaultCountries = [
  CountryData(name: 'United States', dialCode: '+1'),
  CountryData(name: 'Canada', dialCode: '+1'),
  CountryData(name: 'United Kingdom', dialCode: '+44'),
  CountryData(name: 'Nigeria', dialCode: '+234'),
  CountryData(name: 'Germany', dialCode: '+49'),
  CountryData(name: 'France', dialCode: '+33'),
  CountryData(name: 'Australia', dialCode: '+61'),
  CountryData(name: 'South Africa', dialCode: '+27'),
];
