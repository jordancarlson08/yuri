// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

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

UriExample _$UriExampleFromJson(Map<String, dynamic> json) => UriExample(
      json['label'] as String,
      json['uri'] as String,
    );

Map<String, dynamic> _$UriExampleToJson(UriExample instance) =>
    <String, dynamic>{
      'label': instance.label,
      'uri': instance.uri,
    };
