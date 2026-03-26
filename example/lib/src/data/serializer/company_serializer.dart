import 'package:everything_i_need/everything_i_need.dart';

import '../response/company.dart';

class CompanySerializer extends EinBaseSerializer<Company> {
  @override
  Company fromJson(dynamic data) {
    return Company(
      data['name'] as String?,
      data['catchPhrase'] as String?,
      data['bs'] as String?,
    );
  }
}
