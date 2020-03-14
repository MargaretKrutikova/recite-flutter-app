// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'add_citation_mutation.graphql.g.dart';

mixin AddCitation$CitationMixin {
  int id;
  String text;
  DateTime added;
  AddCitation$mutation_root$citations$authors author;
}

@JsonSerializable(explicitToJson: true)
class AddCitation$mutation_root$citations_mutation_response$citations
    with EquatableMixin, AddCitation$CitationMixin {
  AddCitation$mutation_root$citations_mutation_response$citations();

  factory AddCitation$mutation_root$citations_mutation_response$citations.fromJson(
          Map<String, dynamic> json) =>
      _$AddCitation$mutation_root$citations_mutation_response$citationsFromJson(
          json);

  @override
  List<Object> get props => [id, text, added, author];
  Map<String, dynamic> toJson() =>
      _$AddCitation$mutation_root$citations_mutation_response$citationsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class AddCitation$mutation_root$citations_mutation_response
    with EquatableMixin {
  AddCitation$mutation_root$citations_mutation_response();

  factory AddCitation$mutation_root$citations_mutation_response.fromJson(
          Map<String, dynamic> json) =>
      _$AddCitation$mutation_root$citations_mutation_responseFromJson(json);

  List<AddCitation$mutation_root$citations_mutation_response$citations>
      returning;

  @override
  List<Object> get props => [returning];
  Map<String, dynamic> toJson() =>
      _$AddCitation$mutation_root$citations_mutation_responseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddCitation$mutation_root with EquatableMixin {
  AddCitation$mutation_root();

  factory AddCitation$mutation_root.fromJson(Map<String, dynamic> json) =>
      _$AddCitation$mutation_rootFromJson(json);

  AddCitation$mutation_root$citations_mutation_response insert_citations;

  @override
  List<Object> get props => [insert_citations];
  Map<String, dynamic> toJson() => _$AddCitation$mutation_rootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddCitation$mutation_root$citations$authors with EquatableMixin {
  AddCitation$mutation_root$citations$authors();

  factory AddCitation$mutation_root$citations$authors.fromJson(
          Map<String, dynamic> json) =>
      _$AddCitation$mutation_root$citations$authorsFromJson(json);

  int id;

  String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() =>
      _$AddCitation$mutation_root$citations$authorsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddCitationArguments extends JsonSerializable with EquatableMixin {
  AddCitationArguments(
      {@required this.text,
      @required this.collectionId,
      @required this.authorName,
      @required this.date});

  factory AddCitationArguments.fromJson(Map<String, dynamic> json) =>
      _$AddCitationArgumentsFromJson(json);

  final String text;

  final String collectionId;

  final String authorName;

  final DateTime date;

  @override
  List<Object> get props => [text, collectionId, authorName, date];
  Map<String, dynamic> toJson() => _$AddCitationArgumentsToJson(this);
}

class AddCitationMutation
    extends GraphQLQuery<AddCitation$mutation_root, AddCitationArguments> {
  AddCitationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'AddCitation'),
        variableDefinitions: [
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
                      FragmentSpreadNode(
                          name: NameNode(value: 'Citation'), directives: [])
                    ]))
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'Citation'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'citations'), isNonNull: false)),
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
  ]);

  @override
  final String operationName = 'AddCitation';

  @override
  final AddCitationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  AddCitation$mutation_root parse(Map<String, dynamic> json) =>
      AddCitation$mutation_root.fromJson(json);
}
