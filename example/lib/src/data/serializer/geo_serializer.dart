import 'package:everything_i_need/everything_i_need.dart';

import '../response/geo.dart';

class GeoSerializer extends EinBaseSerializer<Geo> {
  @override
  Geo fromJson(dynamic data) {
    return Geo(data['lat'] as String?, data['lng'] as String?);
  }
}
