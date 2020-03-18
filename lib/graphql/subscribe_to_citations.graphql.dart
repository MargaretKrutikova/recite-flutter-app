// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'subscribe_to_citations.graphql.g.dart';

mixin GetCitationsAfterId$CitationMixin {
  int id;
  String text;
  DateTime added;
  GetCitationsAfterId$subscription_root$citations$authors author;
}

@JsonSerializable(explicitToJson: true)
class GetCitationsAfterId$subscription_root$citations
    with EquatableMixin, GetCitationsAfterId$CitationMixin {
  GetCitationsAfterId$subscription_root$citations();

  factory GetCitationsAfterId$subscription_root$citations.fromJson(
          Map<String, dynamic> json) =>
      _$GetCitationsAfterId$subscription_root$citationsFromJson(json);

  @override
  List<Object> get props => [id, text, added, author];
  Map<String, dynamic> toJson() =>
      _$GetCitationsAfterId$subscription_root$citationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCitationsAfterId$subscription_root with EquatableMixin {
  GetCitationsAfterId$subscription_root();

  factory GetCitationsAfterId$subscription_root.fromJson(
          Map<String, dynamic> json) =>
      _$GetCitationsAfterId$subscription_rootFromJson(json);

  List<GetCitationsAfterId$subscription_root$citations> get_citations_after_id;

  @override
  List<Object> get props => [get_citations_after_id];
  Map<String, dynamic> toJson() =>
      _$GetCitationsAfterId$subscription_rootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCitationsAfterId$subscription_root$citations$authors
    with EquatableMixin {
  GetCitationsAfterId$subscription_root$citations$authors();

  factory GetCitationsAfterId$subscription_root$citations$authors.fromJson(
          Map<String, dynamic> json) =>
      _$GetCitationsAfterId$subscription_root$citations$authorsFromJson(json);

  int id;

  String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() =>
      _$GetCitationsAfterId$subscription_root$citations$authorsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCitationsAfterIdArguments extends JsonSerializable
    with EquatableMixin {
  GetCitationsAfterIdArguments(
      {@required this.collectionId, @required this.lastCitationId});

  factory GetCitationsAfterIdArguments.fromJson(Map<String, dynamic> json) =>
      _$GetCitationsAfterIdArgumentsFromJson(json);

  final String collectionId;

  final int lastCitationId;

  @override
  List<Object> get props => [collectionId, lastCitationId];
  Map<String, dynamic> toJson() => _$GetCitationsAfterIdArgumentsToJson(this);
}

class GetCitationsAfterIdMutation extends GraphQLQuery<
    GetCitationsAfterId$subscription_root, GetCitationsAfterIdArguments> {
  GetCitationsAfterIdMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.subscription,
        name: NameNode(value: 'getCitationsAfterId'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'collectionId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'lastCitationId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'get_citations_after_id'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'args'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'collectionid'),
                          value: VariableNode(
                              name: NameNode(value: 'collectionId'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'lastcitationid'),
                          value: VariableNode(
                              name: NameNode(value: 'lastCitationId')))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FragmentSpreadNode(
                    name: NameNode(value: 'Citation'), directives: [])
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
  final String operationName = 'getCitationsAfterId';

  @override
  final GetCitationsAfterIdArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetCitationsAfterId$subscription_root parse(Map<String, dynamic> json) =>
      GetCitationsAfterId$subscription_root.fromJson(json);
}
