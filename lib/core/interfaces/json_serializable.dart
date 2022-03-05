import 'package:json_annotation/json_annotation.dart';

/// [AppJSONSerializable] models interface
@JsonSerializable()
abstract class AppJSONSerializable {
  /// To JSON
  Map<String, dynamic> toJson();
}
