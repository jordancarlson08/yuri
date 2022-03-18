import 'package:json_annotation/json_annotation.dart';

import 'models.dart';
part 'uri_category.g.dart';

@JsonSerializable()
class UriCategory {
  String name = "";
  List<UriExample> uris = <UriExample>[];

  UriCategory(this.name, this.uris);

  factory UriCategory.fromJson(Map<String, dynamic> json) =>
      _$UriCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$UriCategoryToJson(this);
}