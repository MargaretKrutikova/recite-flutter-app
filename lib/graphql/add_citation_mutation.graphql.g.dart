// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_citation_mutation.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCitation$mutation_root$citations_mutation_response$citations
    _$AddCitation$mutation_root$citations_mutation_response$citationsFromJson(
        Map<String, dynamic> json) {
  return AddCitation$mutation_root$citations_mutation_response$citations()
    ..id = json['id'] as int
    ..text = json['text'] as String
    ..added =
        json['added'] == null ? null : DateTime.parse(json['added'] as String)
    ..author = json['author'] == null
        ? null
        : AddCitation$mutation_root$citations$authors.fromJson(
            json['author'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$AddCitation$mutation_root$citations_mutation_response$citationsToJson(
            AddCitation$mutation_root$citations_mutation_response$citations
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
          'added': instance.added?.toIso8601String(),
          'author': instance.author?.toJson(),
        };

AddCitation$mutation_root$citations_mutation_response
    _$AddCitation$mutation_root$citations_mutation_responseFromJson(
        Map<String, dynamic> json) {
  return AddCitation$mutation_root$citations_mutation_response()
    ..returning = (json['returning'] as List)
        ?.map((e) => e == null
            ? null
            : AddCitation$mutation_root$citations_mutation_response$citations
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic>
    _$AddCitation$mutation_root$citations_mutation_responseToJson(
            AddCitation$mutation_root$citations_mutation_response instance) =>
        <String, dynamic>{
          'returning': instance.returning?.map((e) => e?.toJson())?.toList(),
        };

AddCitation$mutation_root _$AddCitation$mutation_rootFromJson(
    Map<String, dynamic> json) {
  return AddCitation$mutation_root()
    ..insert_citations = json['insert_citations'] == null
        ? null
        : AddCitation$mutation_root$citations_mutation_response.fromJson(
            json['insert_citations'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AddCitation$mutation_rootToJson(
        AddCitation$mutation_root instance) =>
    <String, dynamic>{
      'insert_citations': instance.insert_citations?.toJson(),
    };

AddCitation$mutation_root$citations$authors
    _$AddCitation$mutation_root$citations$authorsFromJson(
        Map<String, dynamic> json) {
  return AddCitation$mutation_root$citations$authors()
    ..id = json['id'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic> _$AddCitation$mutation_root$citations$authorsToJson(
        AddCitation$mutation_root$citations$authors instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AddCitationArguments _$AddCitationArgumentsFromJson(Map<String, dynamic> json) {
  return AddCitationArguments(
    text: json['text'] as String,
    collectionId: json['collectionId'] as String,
    authorName: json['authorName'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$AddCitationArgumentsToJson(
        AddCitationArguments instance) =>
    <String, dynamic>{
      'text': instance.text,
      'collectionId': instance.collectionId,
      'authorName': instance.authorName,
      'date': instance.date?.toIso8601String(),
    };
