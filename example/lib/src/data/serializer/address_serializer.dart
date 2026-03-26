import 'package:everything_i_need/everything_i_need.dart';

import '../response/address.dart';
import 'geo_serializer.dart';

class AddressSerializer extends EinBaseSerializer<Address> {
  @override
  Address fromJson(dynamic data) {
    return Address(
      data['street'] as String?,
      data['suite'] as String?,
      data['city'] as String?,
      data['zipcode'] as String?,
      GeoSerializer().fromJsonOrNull(data['geo']),
    );
  }
}
