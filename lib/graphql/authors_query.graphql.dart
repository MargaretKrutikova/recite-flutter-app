// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'authors_query.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Authors$query_root$authors with EquatableMixin {
  Authors$query_root$authors();

  factory Authors$query_root$authors.fromJson(Map<String, dynamic> json) =>
      _$Authors$query_root$authorsFromJson(json);

  int id;

  String name;

  @override
  List<Object> get props => [id, name];
  Map<String, dynamic> toJson() => _$Authors$query_root$authorsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Authors$query_root with EquatableMixin {
  Authors$query_root();

  factory Authors$query_root.fromJson(Map<String, dynamic> json) =>
      _$Authors$query_rootFromJson(json);

  List<Authors$query_root$authors> authors;

  @override
  List<Object> get props => [authors];
  Map<String, dynamic> toJson() => _$Authors$query_rootToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AuthorsArguments extends JsonSerializable with EquatableMixin {
  AuthorsArguments({@required this.collectionId});

  factory AuthorsArguments.fromJson(Map<String, dynamic> json) =>
      _$AuthorsArgumentsFromJson(json);

  final String collectionId;

  @override
  List<Object> get props => [collectionId];
  Map<String, dynamic> toJson() => _$AuthorsArgumentsToJson(this);
}

class AuthorsQuery extends GraphQLQuery<Authors$query_root, AuthorsArguments> {
  AuthorsQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'Authors'),
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
              name: NameNode(value: 'authors'),
              alias: null,
              arguments: [
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
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'Authors';

  @override
  final AuthorsArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Authors$query_root parse(Map<String, dynamic> json) =>
      Authors$query_root.fromJson(json);
}
