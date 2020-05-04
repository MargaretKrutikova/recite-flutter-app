// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_citation_mutation.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCitation$mutation_root$citations_mutation_response$citations$authors
    _$UpdateCitation$mutation_root$citations_mutation_response$citations$authorsFromJson(
        Map<String, dynamic> json) {
  return UpdateCitation$mutation_root$citations_mutation_response$citations$authors()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic>
    _$UpdateCitation$mutation_root$citations_mutation_response$citations$authorsToJson(
            UpdateCitation$mutation_root$citations_mutation_response$citations$authors
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'name': instance.name,
        };

UpdateCitation$mutation_root$citations_mutation_response$citations
    _$UpdateCitation$mutation_root$citations_mutation_response$citationsFromJson(
        Map<String, dynamic> json) {
  return UpdateCitation$mutation_root$citations_mutation_response$citations()
    ..id = json['id'] as int
    ..text = json['text'] as String
    ..added =
        json['added'] == null ? null : DateTime.parse(json['added'] as String)
    ..author = json['author'] == null
        ? null
        : UpdateCitation$mutation_root$citations_mutation_response$citations$authors
            .fromJson(json['author'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$UpdateCitation$mutation_root$citations_mutation_response$citationsToJson(
            UpdateCitation$mutation_root$citations_mutation_response$citations
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
          'added': instance.added?.toIso8601String(),
          'author': instance.author?.toJson(),
        };

UpdateCitation$mutation_root$citations_mutation_response
    _$UpdateCitation$mutation_root$citations_mutation_responseFromJson(
        Map<String, dynamic> json) {
  return UpdateCitation$mutation_root$citations_mutation_response()
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : UpdateCitation$mutation_root$citations_mutation_response$citations
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String,
    dynamic> _$UpdateCitation$mutation_root$citations_mutation_responseToJson(
        UpdateCitation$mutation_root$citations_mutation_response instance) =>
    <String, dynamic>{
      'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
    };

UpdateCitation$mutation_root _$UpdateCitation$mutation_rootFromJson(
    Map<String, dynamic> json) {
  return UpdateCitation$mutation_root()
    ..insert_citations = json['insert_citations'] == null
        ? null
        : UpdateCitation$mutation_root$citations_mutation_response.fromJson(
            json['insert_citations'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateCitation$mutation_rootToJson(
        UpdateCitation$mutation_root instance) =>
    <String, dynamic>{
      'insert_citations': instance.insert_citations?.toJson(),
    };

UpdateCitationArguments _$UpdateCitationArgumentsFromJson(
    Map<String, dynamic> json) {
  return UpdateCitationArguments(
    id: json['id'] as int,
    text: json['text'] as String,
    collectionId: json['collectionId'] as String,
    authorName: json['authorName'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$UpdateCitationArgumentsToJson(
        UpdateCitationArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'collectionId': instance.collectionId,
      'authorName': instance.authorName,
      'date': instance.date?.toIso8601String(),
    };
