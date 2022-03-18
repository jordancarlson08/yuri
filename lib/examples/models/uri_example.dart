
import 'package:json_annotation/json_annotation.dart';
part 'uri_example.g.dart';

@JsonSerializable()
class UriExample {
  String label;
  String uri;

  UriExample(this.label, this.uri);

  factory UriExample.fromJson(Map<String, dynamic> json) =>
      _$UriExampleFromJson(json);

  Map<String, dynamic> toJson() => _$UriExampleToJson(this);
}