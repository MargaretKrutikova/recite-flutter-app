// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_to_latest_citation.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeToLatestCitation$subscription_root$citations
    _$SubscribeToLatestCitation$subscription_root$citationsFromJson(
        Map<String, dynamic> json) {
  return SubscribeToLatestCitation$subscription_root$citations()
    ..id = json['id'] as int
    ..text = json['text'] as String
    ..added =
        json['added'] == null ? null : DateTime.parse(json['added'] as String)
    ..author = json['author'] == null
        ? null
        : SubscribeToLatestCitation$subscription_root$citations$authors
            .fromJson(json['author'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$SubscribeToLatestCitation$subscription_root$citationsToJson(
            SubscribeToLatestCitation$subscription_root$citations instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
          'added': instance.added?.toIso8601String(),
          'author': instance.author?.toJson(),
        };

SubscribeToLatestCitation$subscription_root
    _$SubscribeToLatestCitation$subscription_rootFromJson(
        Map<String, dynamic> json) {
  return SubscribeToLatestCitation$subscription_root()
    ..get_latest_citation = (json['get_latest_citation'] as List)
        ?.map((e) => e == null
            ? null
            : SubscribeToLatestCitation$subscription_root$citations.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SubscribeToLatestCitation$subscription_rootToJson(
        SubscribeToLatestCitation$subscription_root instance) =>
    <String, dynamic>{
      'get_latest_citation':
          instance.get_latest_citation?.map((e) => e?.toJson())?.toList(),
    };

SubscribeToLatestCitation$subscription_root$citations$authors
    _$SubscribeToLatestCitation$subscription_root$citations$authorsFromJson(
        Map<String, dynamic> json) {
  return SubscribeToLatestCitation$subscription_root$citations$authors()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic>
    _$SubscribeToLatestCitation$subscription_root$citations$authorsToJson(
            SubscribeToLatestCitation$subscription_root$citations$authors
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
        };

SubscribeToLatestCitationArguments _$SubscribeToLatestCitationArgumentsFromJson(
    Map<String, dynamic> json) {
  return SubscribeToLatestCitationArguments(
    collectionId: json['collectionId'] as String,
  );
}

Map<String, dynamic> _$SubscribeToLatestCitationArgumentsToJson(
        SubscribeToLatestCitationArguments instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
    };
