// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_to_citations.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCitationsAfterId$subscription_root$citations
    _$GetCitationsAfterId$subscription_root$citationsFromJson(
        Map<String, dynamic> json) {
  return GetCitationsAfterId$subscription_root$citations()
    ..id = json['id'] as int
    ..text = json['text'] as String
    ..added =
        json['added'] == null ? null : DateTime.parse(json['added'] as String)
    ..author = json['author'] == null
        ? null
        : GetCitationsAfterId$subscription_root$citations$authors.fromJson(
            json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetCitationsAfterId$subscription_root$citationsToJson(
        GetCitationsAfterId$subscription_root$citations instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'added': instance.added?.toIso8601String(),
      'author': instance.author?.toJson(),
    };

GetCitationsAfterId$subscription_root
    _$GetCitationsAfterId$subscription_rootFromJson(Map<String, dynamic> json) {
  return GetCitationsAfterId$subscription_root()
    ..get_citations_after_id = (json['get_citations_after_id'] as List)
        ?.map((e) => e == null
            ? null
            : GetCitationsAfterId$subscription_root$citations.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetCitationsAfterId$subscription_rootToJson(
        GetCitationsAfterId$subscription_root instance) =>
    <String, dynamic>{
      'get_citations_after_id':
          instance.get_citations_after_id?.map((e) => e?.toJson())?.toList(),
    };

GetCitationsAfterId$subscription_root$citations$authors
    _$GetCitationsAfterId$subscription_root$citations$authorsFromJson(
        Map<String, dynamic> json) {
  return GetCitationsAfterId$subscription_root$citations$authors()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic>
    _$GetCitationsAfterId$subscription_root$citations$authorsToJson(
            GetCitationsAfterId$subscription_root$citations$authors instance) =>
        <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
        };

GetCitationsAfterIdArguments _$GetCitationsAfterIdArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetCitationsAfterIdArguments(
    collectionId: json['collectionId'] as String,
    lastCitationId: json['lastCitationId'] as int,
  );
}

Map<String, dynamic> _$GetCitationsAfterIdArgumentsToJson(
        GetCitationsAfterIdArguments instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'lastCitationId': instance.lastCitationId,
    };
