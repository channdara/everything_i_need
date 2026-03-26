import 'package:everything_i_need/everything_i_need.dart';

import '../response/user.dart';
import 'address_serializer.dart';
import 'company_serializer.dart';

class UserSerializer extends EinBaseSerializer<User> {
  @override
  User fromJson(dynamic data) {
    return User(
      data['id'] as int?,
      data['name'] as String?,
      data['username'] as String?,
      data['email'] as String?,
      AddressSerializer().fromJsonOrNull(data['address']),
      data['phone'] as String?,
      data['website'] as String?,
      CompanySerializer().fromJsonOrNull(data['company']),
    );
  }
}
