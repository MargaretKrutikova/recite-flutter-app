// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authors_query.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authors$query_root$authors _$Authors$query_root$authorsFromJson(
    Map<String, dynamic> json) {
  return Authors$query_root$authors()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic> _$Authors$query_root$authorsToJson(
        Authors$query_root$authors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Authors$query_root _$Authors$query_rootFromJson(Map<String, dynamic> json) {
  return Authors$query_root()
    ..authors = (json['authors'] as List)
        ?.map((e) => e == null
            ? null
            : Authors$query_root$authors.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Authors$query_rootToJson(Authors$query_root instance) =>
    <String, dynamic>{
      'authors': instance.authors?.map((e) => e?.toJson())?.toList(),
    };

AuthorsArguments _$AuthorsArgumentsFromJson(Map<String, dynamic> json) {
  return AuthorsArguments(
    collectionId: json['collectionId'] as String,
  );
}

Map<String, dynamic> _$AuthorsArgumentsToJson(AuthorsArguments instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
    };
