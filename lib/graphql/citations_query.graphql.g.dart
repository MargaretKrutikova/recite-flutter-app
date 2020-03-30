// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citations_query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Citations$query_root$citations _$Citations$query_root$citationsFromJson(
    Map<String, dynamic> json) {
  return Citations$query_root$citations()
    ..id = json['id'] as int
    ..text = json['text'] as String
    ..added =
        json['added'] == null ? null : DateTime.parse(json['added'] as String)
    ..author = json['author'] == null
        ? null
        : Citations$query_root$citations$authors.fromJson(
            json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Citations$query_root$citationsToJson(
        Citations$query_root$citations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'added': instance.added?.toIso8601String(),
      'author': instance.author?.toJson(),
    };

Citations$query_root _$Citations$query_rootFromJson(Map<String, dynamic> json) {
  return Citations$query_root()
    ..citations = (json['citations'] as List)
        ?.map((e) => e == null
            ? null
            : Citations$query_root$citations.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Citations$query_rootToJson(
        Citations$query_root instance) =>
    <String, dynamic>{
      'citations': instance.citations?.map((e) => e?.toJson())?.toList(),
    };

Citations$query_root$citations$authors
    _$Citations$query_root$citations$authorsFromJson(
        Map<String, dynamic> json) {
  return Citations$query_root$citations$authors()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic> _$Citations$query_root$citations$authorsToJson(
        Citations$query_root$citations$authors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CitationsArguments _$CitationsArgumentsFromJson(Map<String, dynamic> json) {
  return CitationsArguments(
    collectionId: json['collectionId'] as String,
    limit: json['limit'] as int,
    offset: json['offset'] as int,
  );
}

Map<String, dynamic> _$CitationsArgumentsToJson(CitationsArguments instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'limit': instance.limit,
      'offset': instance.offset,
    };
