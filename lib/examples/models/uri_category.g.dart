// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uri_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UriCategory _$UriCategoryFromJson(Map<String, dynamic> json) => UriCategory(
      json['name'] as String,
      (json['uris'] as List<dynamic>)
          .map((e) => UriExample.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UriCategoryToJson(UriCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uris': instance.uris,
    };
