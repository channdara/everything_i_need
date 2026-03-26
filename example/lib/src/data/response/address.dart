import 'geo.dart';

class Address {
  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;
}
