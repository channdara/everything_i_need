import '../extension/ein_map_extension.dart';

abstract class EinBaseRequest {
  Map<String, dynamic> get requestBody => toMap().removeNulls();

  Map<String, dynamic> toMap();
}
