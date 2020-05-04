// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'update_citation_mutation.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateCitation$mutation_root$citations_mutation_response$citations$authors
    with EquatableMixin {
  UpdateCitation$mutation_root$citations_mutation_response$citations$authors();

  factory UpdateCitation$mutation_root$citations_mutation_response$citations$authors.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCitation$mutation_root$citations_mutation_response$citations$authorsFromJson(
          json);

  int id;

  String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() =>
      _$UpdateCitation$mutation_root$citations_mutation_response$citations$authorsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UpdateCitation$mutation_root$citations_mutation_response$citations
    with EquatableMixin {
  UpdateCitation$mutation_root$citations_mutation_response$citations();

  factory UpdateCitation$mutation_root$citations_mutation_response$citations.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCitation$mutation_root$citations_mutation_response$citationsFromJson(
          json);

  int id;

  String text;

  DateTime added;

  UpdateCitation$mutation_root$citations_mutation_response$citations$authors
      author;

  @override
  List<Object> get props => [id, text, added, author];
  Map<String, dynamic> toJson() =>
      _$UpdateCitation$mutation_root$citations_mutation_response$citationsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class UpdateCitation$mutation_root$citations_mutation_response
    with EquatableMixin {
  UpdateCitation$mutation_root$citations_mutation_response();

  factory UpdateCitation$mutation_root$citations_mutation_response.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateCitation$mutation_root$citations_mutation_responseFromJson(json);

  List<UpdateCitation$mutation_root$citations_mutation_response$citations>
      returning;

  @override
  List<Object> get props => [returning];
  Map<String, dynamic> toJson() =>
      _$UpdateCitation$mutation_root$citations_mutation_responseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateCitation$mutation_root with EquatableMixin {
  UpdateCitation$mutation_root();

  factory UpdateCitation$mutation_root.fromJson(Map<String, dynamic> json) =>
      _$UpdateCitation$mutation_rootFromJson(json);

  UpdateCitation$mutation_root$citations_mutation_response insert_citations;

  @override
  List<Object> get props => [insert_citations];
  Map<String, dynamic> toJson() => _$UpdateCitation$mutation_rootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateCitationArguments extends JsonSerializable with EquatableMixin {
  UpdateCitationArguments(
      {@required this.id,
      @required this.text,
      @required this.collectionId,
      @required this.authorName,
      @required this.date});

  factory UpdateCitationArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateCitationArgumentsFromJson(json);

  final int id;

  final String text;

  final String collectionId;

  final String authorName;

  final DateTime date;

  @override
  List<Object> get props => [id, text, collectionId, authorName, date];
  Map<String, dynamic> toJson() => _$UpdateCitationArgumentsToJson(this);
}

class UpdateCitationMutation extends GraphQLQuery<UpdateCitation$mutation_root,
    UpdateCitationArguments> {
  UpdateCitationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'UpdateCitation'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'text')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'collectionId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'authorName')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'date')),
              type:
                  NamedTypeNode(name: NameNode(value: 'date'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'insert_citations'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'objects'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: VariableNode(name: NameNode(value: 'id'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'text'),
                          value: VariableNode(name: NameNode(value: 'text'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'collectionId'),
                          value: VariableNode(
                              name: NameNode(value: 'collectionId'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'added'),
                          value: VariableNode(name: NameNode(value: 'date'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'author'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: 'data'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                      name: NameNode(value: 'name'),
                                      value: VariableNode(
                                          name: NameNode(value: 'authorName'))),
                                  ObjectFieldNode(
                                      name: NameNode(value: 'collectionId'),
                                      value: VariableNode(
                                          name:
                                              NameNode(value: 'collectionId')))
                                ])),
                            ObjectFieldNode(
                                name: NameNode(value: 'on_conflict'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                      name: NameNode(value: 'constraint'),
                                      value: EnumValueNode(
                                          name: NameNode(
                                              value:
                                                  'authors_name_collectionId_key'))),
                                  ObjectFieldNode(
                                      name: NameNode(value: 'update_columns'),
                                      value: EnumValueNode(
                                          name: NameNode(value: 'name')))
                                ]))
                          ]))
                    ])),
                ArgumentNode(
                    name: NameNode(value: 'on_conflict'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'constraint'),
                          value: EnumValueNode(
                              name: NameNode(value: 'citations_pkey'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'update_columns'),
                          value: ListValueNode(values: [
                            EnumValueNode(name: NameNode(value: 'id')),
                            EnumValueNode(name: NameNode(value: 'text')),
                            EnumValueNode(name: NameNode(value: 'authorId')),
                            EnumValueNode(
                                name: NameNode(value: 'collectionId')),
                            EnumValueNode(name: NameNode(value: 'added'))
                          ]))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'returning'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'text'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'added'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'author'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'name'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'UpdateCitation';

  @override
  final UpdateCitationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  UpdateCitation$mutation_root parse(Map<String, dynamic> json) =>
      UpdateCitation$mutation_root.fromJson(json);
}
