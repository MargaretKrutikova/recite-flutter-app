// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citations_query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Citations$query_root$collections$citations$authors
    _$Citations$query_root$collections$citations$authorsFromJson(
        Map<String, dynamic> json) {
  return Citations$query_root$collections$citations$authors()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic> _$Citations$query_root$collections$citations$authorsToJson(
        Citations$query_root$collections$citations$authors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Citations$query_root$collections$citations
    _$Citations$query_root$collections$citationsFromJson(
        Map<String, dynamic> json) {
  return Citations$query_root$collections$citations()
    ..id = json['id'] as int
    ..text = json['text'] as String
    ..added =
        json['added'] == null ? null : DateTime.parse(json['added'] as String)
    ..author = json['author'] == null
        ? null
        : Citations$query_root$collections$citations$authors.fromJson(
            json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Citations$query_root$collections$citationsToJson(
        Citations$query_root$collections$citations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'added': instance.added?.toIso8601String(),
      'author': instance.author?.toJson(),
    };

Citations$query_root$collections _$Citations$query_root$collectionsFromJson(
    Map<String, dynamic> json) {
  return Citations$query_root$collections()
    ..id = json['id'] as String
    ..citations = (json['citations'] as List)
        ?.map((e) => e == null
            ? null
            : Citations$query_root$collections$citations.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Citations$query_root$collectionsToJson(
        Citations$query_root$collections instance) =>
    <String, dynamic>{
      'id': instance.id,
      'citations': instance.citations?.map((e) => e?.toJson())?.toList(),
    };

Citations$query_root _$Citations$query_rootFromJson(Map<String, dynamic> json) {
  return Citations$query_root()
    ..collections = (json['collections'] as List)
        ?.map((e) => e == null
            ? null
            : Citations$query_root$collections.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Citations$query_rootToJson(
        Citations$query_root instance) =>
    <String, dynamic>{
      'collections': instance.collections?.map((e) => e?.toJson())?.toList(),
    };

CitationsArguments _$CitationsArgumentsFromJson(Map<String, dynamic> json) {
  return CitationsArguments(
    slug: json['slug'] as String,
  );
}

Map<String, dynamic> _$CitationsArgumentsToJson(CitationsArguments instance) =>
    <String, dynamic>{
      'slug': instance.slug,
    };
