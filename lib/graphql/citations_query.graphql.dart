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
class Citations$query_root$collections$citations
    with EquatableMixin, Citations$CitationMixin {
  Citations$query_root$collections$citations();

  factory Citations$query_root$collections$citations.fromJson(
          Map<String, dynamic> json) =>
      _$Citations$query_root$collections$citationsFromJson(json);

  @override
  List<Object> get props => [id, text, added, author];
  Map<String, dynamic> toJson() =>
      _$Citations$query_root$collections$citationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Citations$query_root$collections with EquatableMixin {
  Citations$query_root$collections();

  factory Citations$query_root$collections.fromJson(
          Map<String, dynamic> json) =>
      _$Citations$query_root$collectionsFromJson(json);

  String id;

  List<Citations$query_root$collections$citations> citations;

  @override
  List<Object> get props => [id, citations];
  Map<String, dynamic> toJson() =>
      _$Citations$query_root$collectionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Citations$query_root with EquatableMixin {
  Citations$query_root();

  factory Citations$query_root.fromJson(Map<String, dynamic> json) =>
      _$Citations$query_rootFromJson(json);

  List<Citations$query_root$collections> collections;

  @override
  List<Object> get props => [collections];
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
  CitationsArguments({@required this.slug});

  factory CitationsArguments.fromJson(Map<String, dynamic> json) =>
      _$CitationsArgumentsFromJson(json);

  final String slug;

  @override
  List<Object> get props => [slug];
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
              variable: VariableNode(name: NameNode(value: 'slug')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'collections'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'where'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                          name: NameNode(value: 'slug'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: '_eq'),
                                value:
                                    VariableNode(name: NameNode(value: 'slug')))
                          ]))
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'citations'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                          name: NameNode(value: 'order_by'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: 'added'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'desc'))),
                            ObjectFieldNode(
                                name: NameNode(value: 'id'),
                                value: EnumValueNode(
                                    name: NameNode(value: 'desc')))
                          ]))
                    ],
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
  final String operationName = 'Citations';

  @override
  final CitationsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Citations$query_root parse(Map<String, dynamic> json) =>
      Citations$query_root.fromJson(json);
}
