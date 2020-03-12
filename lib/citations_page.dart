import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:recite_flutter/widgets/add_citation_button.dart';
import 'package:recite_flutter/widgets/citations_list.dart';

import './graphql/citations_query.dart';

class CitationsPage extends StatelessWidget {
  CitationsPage(
      {Key key,
      @required this.title,
      @required this.client,
      @required this.collectionSlug})
      : super(key: key);

  final String title;
  final String collectionSlug;
  final GraphQLClient client;

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          documentNode: CitationsQuery(
                  variables: CitationsArguments(slug: collectionSlug))
              .document,
          variables: CitationsArguments(slug: collectionSlug).toJson(),
        ),
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

          final data = Citations$query_root.fromJson(result.data);
          final collection =
              data.collections.length > 0 ? data.collections[0] : null;
          final List<Citations$query_root$collections$citations> citations =
              collection != null ? collection.citations : [];

          final collectionId = collection != null ? collection.id : null;

          return Scaffold(
            appBar: AppBar(
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Text(this.title),
            ),
            body: new Center(
                child: new Column(
              children: <Widget>[
                Expanded(child: CitationsList(citations: citations)),
              ],
            )),
            floatingActionButton: AddCitationButton(
              client: this.client,
              collectionId: collectionId,
              refetch: refetch,
            ),
          );
        });
  }
}
