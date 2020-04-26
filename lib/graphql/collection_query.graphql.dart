// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'collection_query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Collection$query_root$collections with EquatableMixin {
  Collection$query_root$collections();

  factory Collection$query_root$collections.fromJson(
          Map<String, dynamic> json) =>
      _$Collection$query_root$collectionsFromJson(json);

  String id;

  String name;

  String slug;

  @override
  List<Object> get props => [id, name, slug];
  Map<String, dynamic> toJson() =>
      _$Collection$query_root$collectionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Collection$query_root with EquatableMixin {
  Collection$query_root();

  factory Collection$query_root.fromJson(Map<String, dynamic> json) =>
      _$Collection$query_rootFromJson(json);

  List<Collection$query_root$collections> collections;

  @override
  List<Object> get props => [collections];
  Map<String, dynamic> toJson() => _$Collection$query_rootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CollectionArguments extends JsonSerializable with EquatableMixin {
  CollectionArguments({@required this.namePattern});

  factory CollectionArguments.fromJson(Map<String, dynamic> json) =>
      _$CollectionArgumentsFromJson(json);

  final String namePattern;

  @override
  List<Object> get props => [namePattern];
  Map<String, dynamic> toJson() => _$CollectionArgumentsToJson(this);
}

class CollectionQuery
    extends GraphQLQuery<Collection$query_root, CollectionArguments> {
  CollectionQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Collection'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'namePattern')),
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
                          name: NameNode(value: 'name'),
                          value: ObjectValueNode(fields: [
                            ObjectFieldNode(
                                name: NameNode(value: '_ilike'),
                                value: VariableNode(
                                    name: NameNode(value: 'namePattern')))
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
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'slug'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'Collection';

  @override
  final CollectionArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Collection$query_root parse(Map<String, dynamic> json) =>
      Collection$query_root.fromJson(json);
}
