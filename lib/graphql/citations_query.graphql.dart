// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'citations_query.graphql.g.dart';

mixin Citations$CitationMixin {
  int id;
  String text;
  DateTime added;
  Citations$query_root$citations$authors author;
}

@JsonSerializable(explicitToJson: true)
class Citations$query_root$citations
    with EquatableMixin, Citations$CitationMixin {
  Citations$query_root$citations();

  factory Citations$query_root$citations.fromJson(Map<String, dynamic> json) =>
      _$Citations$query_root$citationsFromJson(json);

  @override
  List<Object> get props => [id, text, added, author];
  Map<String, dynamic> toJson() => _$Citations$query_root$citationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Citations$query_root with EquatableMixin {
  Citations$query_root();

  factory Citations$query_root.fromJson(Map<String, dynamic> json) =>
      _$Citations$query_rootFromJson(json);

  List<Citations$query_root$citations> citations;

  @override
  List<Object> get props => [citations];
  Map<String, dynamic> toJson() => _$Citations$query_rootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Citations$query_root$citations$authors with EquatableMixin {
  Citations$query_root$citations$authors();

  factory Citations$query_root$citations$authors.fromJson(
          Map<String, dynamic> json) =>
      _$Citations$query_root$citations$authorsFromJson(json);

  int id;

  String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() =>
      _$Citations$query_root$citations$authorsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CitationsArguments extends JsonSerializable with EquatableMixin {
  CitationsArguments(
      {@required this.collectionId,
      @required this.limit,
      @required this.offset});

  factory CitationsArguments.fromJson(Map<String, dynamic> json) =>
      _$CitationsArgumentsFromJson(json);

  final String collectionId;

  final int limit;

  final int offset;

  @override
  List<Object> get props => [collectionId, limit, offset];
  Map<String, dynamic> toJson() => _$CitationsArgumentsToJson(this);
}

class CitationsQuery
    extends GraphQLQuery<Citations$query_root, CitationsArguments> {
  CitationsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Citations'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'collectionId')),
              type:
                  NamedTypeNode(name: NameNode(value: 'uuid'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'limit')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'offset')),
              type:
                  NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'citations'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'order_by'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'added'),
                          value: EnumValueNode(name: NameNode(value: 'desc'))),
                      ObjectFieldNode(
                          name: NameNode(value: 'id'),
                          value: EnumValueNode(name: NameNode(value: 'desc')))
                    ])),
                ArgumentNode(
                    name: NameNode(value: 'where'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'collectionId'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value: VariableNode(
                                    name: NameNode(value: 'collectionId')))
                          ]))
                    ])),
                ArgumentNode(
                    name: NameNode(value: 'limit'),
                    value: VariableNode(name: NameNode(value: 'limit'))),
                ArgumentNode(
                    name: NameNode(value: 'offset'),
                    value: VariableNode(name: NameNode(value: 'offset')))
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
  final String operationName = 'Citations';

  @override
  final CitationsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Citations$query_root parse(Map<String, dynamic> json) =>
      Citations$query_root.fromJson(json);
}
