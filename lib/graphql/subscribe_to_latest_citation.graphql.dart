// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'subscribe_to_latest_citation.graphql.g.dart';

mixin SubscribeToLatestCitation$CitationMixin {
  int id;
  String text;
  DateTime added;
  SubscribeToLatestCitation$subscription_root$citations$authors author;
}

@JsonSerializable(explicitToJson: true)
class SubscribeToLatestCitation$subscription_root$citations
    with EquatableMixin, SubscribeToLatestCitation$CitationMixin {
  SubscribeToLatestCitation$subscription_root$citations();

  factory SubscribeToLatestCitation$subscription_root$citations.fromJson(
          Map<String, dynamic> json) =>
      _$SubscribeToLatestCitation$subscription_root$citationsFromJson(json);

  @override
  List<Object> get props => [id, text, added, author];
  Map<String, dynamic> toJson() =>
      _$SubscribeToLatestCitation$subscription_root$citationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubscribeToLatestCitation$subscription_root with EquatableMixin {
  SubscribeToLatestCitation$subscription_root();

  factory SubscribeToLatestCitation$subscription_root.fromJson(
          Map<String, dynamic> json) =>
      _$SubscribeToLatestCitation$subscription_rootFromJson(json);

  List<SubscribeToLatestCitation$subscription_root$citations>
      get_latest_citation;

  @override
  List<Object> get props => [get_latest_citation];
  Map<String, dynamic> toJson() =>
      _$SubscribeToLatestCitation$subscription_rootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubscribeToLatestCitation$subscription_root$citations$authors
    with EquatableMixin {
  SubscribeToLatestCitation$subscription_root$citations$authors();

  factory SubscribeToLatestCitation$subscription_root$citations$authors.fromJson(
          Map<String, dynamic> json) =>
      _$SubscribeToLatestCitation$subscription_root$citations$authorsFromJson(
          json);

  int id;

  String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() =>
      _$SubscribeToLatestCitation$subscription_root$citations$authorsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class SubscribeToLatestCitationArguments extends JsonSerializable
    with EquatableMixin {
  SubscribeToLatestCitationArguments({@required this.collectionId});

  factory SubscribeToLatestCitationArguments.fromJson(
          Map<String, dynamic> json) =>
      _$SubscribeToLatestCitationArgumentsFromJson(json);

  final String collectionId;

  @override
  List<Object> get props => [collectionId];
  Map<String, dynamic> toJson() =>
      _$SubscribeToLatestCitationArgumentsToJson(this);
}

class SubscribeToLatestCitationMutation extends GraphQLQuery<
    SubscribeToLatestCitation$subscription_root,
    SubscribeToLatestCitationArguments> {
  SubscribeToLatestCitationMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.subscription,
        name: null,
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'collectionId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'get_latest_citation'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'args'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'collectionid'),
                          value: VariableNode(
                              name: NameNode(value: 'collectionId')))
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
  final String operationName = 'subscribe_to_latest_citation';

  @override
  final SubscribeToLatestCitationArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  SubscribeToLatestCitation$subscription_root parse(
          Map<String, dynamic> json) =>
      SubscribeToLatestCitation$subscription_root.fromJson(json);
}
