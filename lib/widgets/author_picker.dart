import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/graphql/authors_query.graphql.dart';
import 'package:recite_flutter/models/author.dart';
import 'package:recite_flutter/theme.dart';

typedef OnSelect = void Function(String);

class AuthorPicker extends StatelessWidget {
  AuthorPicker(
      {this.selectedAuthorName,
      @required this.collectionId,
      @required this.onSelect});

  final OnSelect onSelect;
  final String collectionId;
  final String selectedAuthorName;

  Widget _buildRow(Author author, BuildContext context) {
    return GestureDetector(
        onTap: () => this.onSelect(author.name),
        child: Container(
            padding: EdgeInsets.all(12.0),
            height: 50.0,
            decoration: new BoxDecoration(
                color: AppColors.darkerBackgroundColor,
                border: new Border(
                    bottom: BorderSide(color: Colors.grey[600], width: 1.0))),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  author.name,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                selectedAuthorName == author.name
                    ? Icon(Icons.done, color: AppColors.primaryColor)
                    : SizedBox.shrink()
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    final _variables = AuthorsArguments(collectionId: this.collectionId);
    final query = AuthorsQuery(variables: _variables);

    return Query(
        options: QueryOptions(
            documentNode: query.document,
            variables: query.variables.toJson(),
            fetchPolicy: FetchPolicy.cacheAndNetwork),
        builder: (
          QueryResult result, {
          Refetch refetch,
          FetchMore fetchMore,
        }) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading && result.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final authors = Authors$query_root.fromJson(result.data)
              .authors
              .map((author) => Author(id: author.id, name: author.name))
              .toList();

          return Container(
              child: Scrollbar(
                  child: ListView.builder(
                      itemCount: authors.length,
                      itemBuilder: (context, i) =>
                          _buildRow(authors[i], context))));
        });
  }
}
