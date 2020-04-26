// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection$query_root$collections _$Collection$query_root$collectionsFromJson(
    Map<String, dynamic> json) {
  return Collection$query_root$collections()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..slug = json['slug'] as String;
}

Map<String, dynamic> _$Collection$query_root$collectionsToJson(
        Collection$query_root$collections instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

Collection$query_root _$Collection$query_rootFromJson(
    Map<String, dynamic> json) {
  return Collection$query_root()
    ..collections = (json['collections'] as List)
        ?.map((e) => e == null
            ? null
            : Collection$query_root$collections.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Collection$query_rootToJson(
        Collection$query_root instance) =>
    <String, dynamic>{
      'collections': instance.collections?.map((e) => e?.toJson())?.toList(),
    };

CollectionArguments _$CollectionArgumentsFromJson(Map<String, dynamic> json) {
  return CollectionArguments(
    namePattern: json['namePattern'] as String,
  );
}

Map<String, dynamic> _$CollectionArgumentsToJson(
        CollectionArguments instance) =>
    <String, dynamic>{
      'namePattern': instance.namePattern,
    };
